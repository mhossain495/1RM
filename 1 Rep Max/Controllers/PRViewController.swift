//
//  PRViewController.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 12/16/20.
//

import UIKit
import CoreData


class PRViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    // Array of historical one rep max data objects
    var historicalDataArray = [HistoricalEntity]()
    
    // Access to context of persistent container to allow app to interact with database
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        // Load historical exercise data from Core Data
        fetchData()

    }
    
    // Call fetchData before view is loaded to reload tableview data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    //MARK: - Core Data Methods
    
    // Fetch data from Core Data and refresh to display in tableview
    func fetchData() {
        
        do {
            historicalDataArray = try context.fetch(HistoricalEntity.fetchRequest())
            
            // Reload table view data and run task in main thread
            DispatchQueue.main.async {
                self.historyTableView.reloadData()
            }
        } catch {
            print("Error fetching data from context: \(error)")
        }
    }

    //MARK: - TableView Delete Method
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            // Object or cell to remove based on indexPath row selected
            let dataToRemove = self.historicalDataArray[indexPath.row]
            
            
            // Remove or delete the object frome Core Data
            self.context.delete(dataToRemove)
            
            // Save the data after removing
            
            do {
                try self.context.save()
            } catch {
                
            }
            
            // Re-fetch the data
            self.fetchData()
        }
        
        
        // Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
    

}

//MARK: - TableView Delegate

extension PRViewController: UITableViewDelegate {

}

//MARK: - TableView DataSource

extension PRViewController: UITableViewDataSource {
    
    // Return the number of rows for table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicalDataArray.count 
    }
    
    // Provide a cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Obtain custom reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        // Configure cell with card shape and shadow effect
        cell.cardView(cell: cell)
        
        // Get historical max data from array and set cell label data
        let historicalData = historicalDataArray[indexPath.row]
        cell.exerciseLabel?.text = historicalData.exercise
        cell.historicMaxLabel?.text = String(format: "%.0f", historicalData.max)
        cell.dateLabel?.text =  historicalData.date?.dateToString()
        
        // cell.exerciseImage.image =
        print(cell.dateLabel.text!)
        return cell
    }
    
}


//MARK: - Date Extension Function

// Function converts Date to string to display in UILabel
extension Date {

    func dateToString(format: String = "MMM d, yyyy") -> String {
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

