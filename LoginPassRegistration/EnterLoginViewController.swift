//
//  EnterLoginViewController.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/5/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

var userDictionary = [String: String]()

class EnterLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var enterYourLoginTextField: UITextField!
    
    @IBOutlet weak var enterYourPasswordTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // MARK: keyboards is open
        enterYourLoginTextField.keyboardType = UIKeyboardType.asciiCapable
        enterYourLoginTextField.becomeFirstResponder()
        
        // MARK: replace Return -> Next
        enterYourLoginTextField.returnKeyType = UIReturnKeyType.next
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // MARK: Navigation Bar hidden
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // MARK: after press Done check second textField
    
    @IBAction func editingEndEnterYourPasswordTextField(_ sender: Any) {
        //enterYourPasswordTextField.becomeFirstResponder()
    }
    
    // MARK: button sign in
    
    @IBAction func signInButton(_ sender: Any) {
        
        // if textField is empty
        if enterYourLoginTextField.text == "" || enterYourPasswordTextField.text == "" {
            alertMessage(message: "Please fill all data")
            return
        }
    }
    
    
    // MARK: alert
    func alertMessage(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionController = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(actionController)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // when enterLoginTextField is active
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        // MARK: replace Return -> Next when enterLoginTextField is active
        if textField == enterYourLoginTextField {
            enterYourLoginTextField.returnKeyType = UIReturnKeyType.next
        }
        if textField == enterYourPasswordTextField {
            enterYourPasswordTextField.returnKeyType = UIReturnKeyType.next
        }
        
        
        return true
    }
    
    // MARK: when enterYourLoginTextField is active and press Next go to enterYourPasswordTextField
    @IBAction func primary(_ sender: Any) {
        enterYourPasswordTextField.becomeFirstResponder()
        
    }
    
    
   
    @IBAction func primaryEnterYourPassword(_ sender: Any) {
        signInButton(enterYourPasswordTextField)
    }

    
    
    
    

}
