//
//  ExcerciseTableViewController.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 12/25/20.
//

import UIKit

class ExcerciseTableViewController: UITableViewController {

    let exerciseArray = ExerciseList().exerciseArray
    
    // Access to context of persistent container to allow app to interact with database
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    

    // MARK: - Table view data source
    
    // Return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return number of rows based on array size
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseArray.count
    }
    
    // Variable to save currently selected index path
    var selectedIndexPath: IndexPath? = IndexPath(row: 0, section: 0)
    
    // Add cell animations when row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Remove gray background color that remains after user taps cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Peform unwind segue and pass value to exercise button in CalculateVC if same row selected
        if indexPath == selectedIndexPath {
            performSegue(withIdentifier: "unwindToCalculateVC", sender: self)
        }
        
        
        // Toggle checkmark on old cell off and on for new cell
        let newCell = tableView.cellForRow(at: indexPath)
        if newCell?.accessoryType == UITableViewCell.AccessoryType.none {
            newCell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        let oldCell = tableView.cellForRow(at: selectedIndexPath!)
        if oldCell?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            oldCell?.accessoryType = UITableViewCell.AccessoryType.none
        }
        // Save selected index path
        selectedIndexPath = indexPath
        
       performSegue(withIdentifier: "unwindToCalculateVC", sender: self)

    }
    
    
    
    // Populate tableView cells with array data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exerciseCell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        exerciseCell.textLabel?.text = exerciseArray[indexPath.row]
        
        // Set the checkmark to currently selected indexPath
        if indexPath == selectedIndexPath {
            exerciseCell.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            exerciseCell.accessoryType = UITableViewCell.AccessoryType.none
        }
        return exerciseCell
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let CalculateVC = segue.destination as? CalculateViewController {
            let selectedExercise = self.tableView.cellForRow(at: selectedIndexPath!)?.textLabel?.text
            CalculateVC.selectedExercise = selectedExercise
        }
    }
    
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
     
    }
    */

    // MARK: - Navigation

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

