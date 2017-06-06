//
//  CreateLoginViewController.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/5/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class CreateLoginViewController: UIViewController {

    @IBOutlet weak var createYourLoginTextField: UITextField!
    
    @IBOutlet weak var createYourPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // alert
    func alertMessage(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionController = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(actionController)
        
        present(alertController, animated: true, completion: nil)
    }
}
