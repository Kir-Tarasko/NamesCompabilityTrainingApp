//
//  ViewController.swift
//  NamesCompabilityTrainingApp
//
//  Created by Kirill Tarasko on 21.11.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var yourNameTextField: UITextField!
    @IBOutlet weak var partnersNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetup()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.firstName = yourNameTextField.text
        resultVC.secondName = partnersNameTextField.text
    }
    

    
    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "goToResult", sender: nil)
       
    }
    
    @IBAction func unwindSegueToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        yourNameTextField.text = ""
        partnersNameTextField.text = ""
    }
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTextField {
            partnersNameTextField.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        return true
    }
    
    private func textFieldSetup() {
        
        let textFields = [yourNameTextField, partnersNameTextField]
        
        for textField in textFields {
            textField?.delegate = self
        }
    }
}

