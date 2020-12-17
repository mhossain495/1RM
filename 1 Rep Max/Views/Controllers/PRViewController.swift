//
//  PRViewController.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 12/16/20.
//

import UIKit


class PRViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        return cell
    }
    
    
}
