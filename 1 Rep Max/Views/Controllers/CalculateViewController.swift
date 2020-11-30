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
    

}

//MARK: - UITextFieldDelegate

extension CalculateViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        // If weight and reps textfield are not nil convert the values to Float else use default value of 0
        let weightValue = Float(weightTextField.text!) ?? Float(0)
        let repsValue = Float(repsTextField.text!) ?? Float(0)
      
        let max = maxCalculator.calculateMax(weight: weightValue, reps: repsValue)
        oneRepMax.text = String(max)

    }
 
}
