//
//  ExcerciseTableViewController.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 12/25/20.
//

import UIKit
import CoreData

class ExcerciseTableViewController: UITableViewController {

    let exerciseArray = ExerciseList().exerciseArray
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    var selectedIndexPath: IndexPath?
    
    // Add cell animations when row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Remove gray background color that remains after user taps cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Save selected index path
        selectedIndexPath = indexPath
        
        // Peform unwind segue and pass value to exercise button in CalculateVC
        performSegue(withIdentifier: "unwindToCalculateVC", sender: self)
        
    }
    
    // Populate tableView cells with array data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exerciseCell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        exerciseCell.textLabel?.text = exerciseArray[indexPath.row]
        
        return exerciseCell
    }
    
//MARK: - Navigation
    // Pass selected exercise to CalculateViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let CalculateVC = segue.destination as? CalculateViewController {
            let selectedExercise = self.tableView.cellForRow(at: selectedIndexPath!)?.textLabel?.text
            CalculateVC.selectedExercise = selectedExercise
        }
    }


}

