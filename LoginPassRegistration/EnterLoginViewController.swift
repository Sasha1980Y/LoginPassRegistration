//
//  EnterLoginViewController.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/5/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

var userDictionary = [String: String]()

class EnterLoginViewController: UIViewController {
    
    @IBOutlet weak var enterYourLoginTextField: UITextField!
    
    @IBOutlet weak var enterYourPasswordTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // keyboards is open
        enterYourLoginTextField.keyboardType = UIKeyboardType.asciiCapable
        enterYourLoginTextField.becomeFirstResponder()
        
        
        
        // replace Return -> Next
        enterYourLoginTextField.returnKeyType = UIReturnKeyType.next
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Navigation Bar hidden
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // after press Done check second textField
    
    @IBAction func editingEndEnterYourPasswordTextField(_ sender: Any) {
        enterYourPasswordTextField.becomeFirstResponder()
    }

    
    
    
    

}
