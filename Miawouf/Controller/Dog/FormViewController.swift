//
//  FormViewController.swift
//  Miawouf
//
//  Created by Paul Ghibeaux on 21/07/2021.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var dog : Pet!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var racePickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
        
    }
    
    @IBAction func validate() {
        createPetObject()
        checkPetStatus()
    }
    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = majoritySwitch.isOn
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender: Pet.Gender = (genderIndex == 0) ? .female : .male
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        
        let race = dogRaces[raceIndex]
        
        dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
        
    }
    
    
    private func checkPetStatus() {
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "segueToSucess", sender: self)
      
        case .rejected(let error):
            presentAlert(with: error)
          
            
        }
        
    }
    
    
    private func presentAlert(with error: String) {
        let alertVC = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSucess" {
            let successVC = segue.destination as! SucessViewController
            
            successVC.dog = dog
            
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        
        
    }
    
    
}
