//
//  FormViewController.swift
//  Miawouf
//
//  Created by Paul Ghibeaux on 21/07/2021.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        

    }
    
    
}
