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
        let weightValue = Float(weightTextField.text ?? String(0))
        let repsValue = Float(repsTextField.text ?? String(0))
      
        let max = maxCalculator.calculateMax(weight: weightValue!, reps: repsValue!)
        oneRepMax.text = String(max)

    }
 
}
