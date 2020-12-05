//
//  ViewController.swift
//  1RM
//
//  Created by Mohammed Hossain on 11/8/20.
//

import UIKit

class CalculateViewController: UIViewController {

    var maxCalculator = MaxCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weightTextField.delegate = self
        repsTextField.delegate = self
    }

 
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var oneRepMax: UILabel!
    
    // Left side labels to populate with weight value
    @IBOutlet weak var twoRMLabel: UILabel!
    @IBOutlet weak var threeRMLabel: UILabel!
    @IBOutlet weak var fourRMLabel: UILabel!
    @IBOutlet weak var fiveRMLabel: UILabel!
    
    // Right side labels to populate with weight value
    @IBOutlet weak var sixRMLabel: UILabel!
    @IBOutlet weak var eightRMLabel: UILabel!
    @IBOutlet weak var tenRMLabel: UILabel!
    @IBOutlet weak var twelveRMLabel: UILabel!
    
}




//MARK: - UITextFieldDelegate

extension CalculateViewController: UITextFieldDelegate {
    
    // textFieldDidEndEditing function will run code and display results after dismissing number pad
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // If weight and reps textfield are not nil, convert the values to Float or else use default value of 0
        let weightValue = Float(weightTextField.text!) ?? Float(0)
        let repsValue = Float(repsTextField.text!) ?? Float(0)
      
        // Calculate one rep max with values obtained from weight and reps text fields
        let max = maxCalculator.calculateMax(weight: weightValue, reps: repsValue)
        oneRepMax.text = String(format: "%.0f", max)
        

        // Calculate max weight for various reps with values obtained from weight and reps text fields
        let twoRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 2)
        twoRMLabel.text = String(format: "%.0f", twoRM)
        
        let threeRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 3)
        threeRMLabel.text = String(format: "%.0f", threeRM)
        
        let fourRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 4)
        fourRMLabel.text = String(format: "%.0f", fourRM)
        
        let fiveRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 5)
        fiveRMLabel.text = String(format: "%.0f", fiveRM)
        
        let sixRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 6)
        sixRMLabel.text = String(format: "%.0f", sixRM)
        
        let eightRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 8)
        eightRMLabel.text = String(format: "%.0f", eightRM)
        
        let tenRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 10)
        tenRMLabel.text = String(format: "%.0f", tenRM)
        
        let twelveRM = maxCalculator.calculateAllMax(oneRepMax: max, reps: 12)
        twelveRMLabel.text = String(format: "%.0f", twelveRM)

    }
 
}
