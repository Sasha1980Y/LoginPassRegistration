//
//  CreateLoginViewController.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/5/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit



class CreateLoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createYourLoginTextField: UITextField!
    
    @IBOutlet weak var createYourPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // "GO" is not activity
        goButton.backgroundColor = UIColor.gray
        goButton.isEnabled = false
        
        // we controll enter info in textField
        textFieldDetective()
        
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        goButton.isEnabled = false
        goButton.backgroundColor = UIColor.gray
    }
    
    
    // press GO button
    @IBAction func goButtonAction(_ sender: Any) {
        
        if createYourPasswordTextField.text != repeatPasswordTextField.text {
            alertMessage(message: "Entered passwords are different")
            
        }
        
        // add user
        WordWithData.saveUser(userToSave: User(login: createYourLoginTextField.text!, password: createYourPasswordTextField.text!))
        
       
        // go to first ViewController
        let storyboard = UIStoryboard(name: "EnterAndRegistration", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "EnterLoginViewController")
        navigationController?.pushViewController(nextViewController, animated: true)
        
        
    }
    
    // wait when field is not empty
    func textFieldDetective() {
        createYourLoginTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        createYourPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    // MARK: all field full
    func textFieldDidChange(textField: UITextField) {
        if (createYourLoginTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || (createYourPasswordTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || (repeatPasswordTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || createYourLoginTextField.text == "" || createYourPasswordTextField.text == "" || repeatPasswordTextField.text == "" {            goButton.isEnabled = false
            goButton.backgroundColor = UIColor.gray        } else {
            goButton.isEnabled = true
            goButton.backgroundColor = UIColor.black
        }
    }
    
    
    
    
    // alert
    func alertMessage(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionController = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(actionController)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}
