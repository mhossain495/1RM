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
    
    var historicalDataArray = [HistoricalEntity]()
    
    // Access to context of persistent container to allow app to interact with database
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
    }
    
    


    

    
}
//MARK: - TableView Delegate

extension PRViewController: UITableViewDelegate {

}


//MARK: - TableView DataSource

extension PRViewController: UITableViewDataSource {
    
    // Return the number of rows for table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    // Provide a cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Obtain custom reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        // Configure cell with card shape and shadow effect
        cell.cardView(cell: cell)
        
        return cell
    }
    
}

