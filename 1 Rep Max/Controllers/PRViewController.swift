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
    
    // Call fetchData before view is loaded to reload table view data
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
        // cell.dateLabel?.text = historicalData.date
        cell.exerciseLabel?.text = historicalData.exercise
        cell.historicMaxLabel?.text = String(format: "%.0f", historicalData.max)
        // cell.exerciseImage.image =
        
        return cell
    }
    
}

