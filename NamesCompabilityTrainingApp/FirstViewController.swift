//
//  FirstViewController.swift
//  NamesCompabilityTrainingApp
//
//  Created by Kirill Tarasko on 21.11.2022.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var yourNameTF: UITextField!
    
    @IBOutlet weak var partnersTF: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.firstName = yourNameTF.text
        resultVC.secondName = partnersTF.text
    }
    
    @IBAction func showResultsButtonTapped() {
        guard let firstName = yourNameTF.text, let secondName = partnersTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(
                title: "Names are missing",
                message: "Please enter both names 😊"
            )
            return
        }
        
        performSegue(withIdentifier: "goToResults", sender: nil)
        
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
//        guard segue.identifier == "goBack" else { return }
        yourNameTF.text = ""
        partnersTF.text = ""

    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnersTF.becomeFirstResponder()
        } else {
            showResultsButtonTapped()
        }
        return true
    }
}
