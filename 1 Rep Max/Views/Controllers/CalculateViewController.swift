//
//  ViewController.swift
//  1RM
//
//  Created by Mohammed Hossain on 11/8/20.
//

import UIKit

class CalculateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weightTextField.delegate = self
        repsTextField.delegate = self
    }

 
    @IBOutlet weak var weightTextField: UITextField!
    

    @IBOutlet weak var repsTextField: UITextField!
    

    
    
    
}


//MARK: - UITextFieldDelegate

extension CalculateViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(weightTextField.text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(repsTextField.text ?? "")
    }

 
}
