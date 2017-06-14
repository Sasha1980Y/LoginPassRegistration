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
    
    // go to create login
    @IBAction func signUpButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "EnterAndRegistration", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "CreateLoginViewController")
        navigationController?.pushViewController(nextViewController, animated: true)
        
        
    }
    
    
    // MARK: button sign in
    
    @IBAction func signInButton(_ sender: Any) {
        
        // if textField is empty
        if enterYourLoginTextField.text == "" || enterYourPasswordTextField.text == "" || (enterYourLoginTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || (enterYourPasswordTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! {
            alertMessage(message: "Please fill all data")
            return
        }
        
        // if login or password is incorrect
        if let  loginText = enterYourLoginTextField.text, let enterText = enterYourPasswordTextField.text {
        if WordWithData.userAlreadyExists(login: loginText) {
            if let newUser = WordWithData.getUser(login: loginText, password: enterText) {
                print(newUser.login)
            } else {
                alertMessage(message: "Login or password is incorrect")
                return
            }
            
        } else {
            alertMessage(message: "Login or password is incorrect")
        }
        }
        
        // go to Author table
        
        let storyboard = UIStoryboard(name: "StoryboardForTable", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForTable")
        present(vc, animated: true)
        
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
    
    
    // when press Next in enterYourPasswordTextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == enterYourPasswordTextField || enterYourPasswordTextField.text != "" {
            
            signInButton(view)
        }
        
        // MARK: when enterYourLoginTextField is active and press Next go to enterYourPasswordTextField
        if textField == enterYourLoginTextField {
            enterYourPasswordTextField.becomeFirstResponder()
        }
        return true
    }
    
        

}
