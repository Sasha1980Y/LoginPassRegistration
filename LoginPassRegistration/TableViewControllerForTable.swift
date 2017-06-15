//
//  TableViewControllerForTable.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/13/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class TableViewControllerForTable: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    
    
    
    
    let sections: [String] = ["Section 1"]
    let s1Data:[String] = ["Row 1","Row 2","Row 3"]
    //let s2Data:[String] = ["Row 1","Row 2","Row 3"]
    //let s3Data:[String] = ["Row 1","Row 2","Row 3"]
    
    var sectionData: [Int: [String]] = [:]
    
    // MARK: Download
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sectionData = [0: s1Data]
    }
    
    
    
    
    
    
    // MARK: My function
    
    // change status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // number rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (sectionData[section]?.count)!
    }
    
    
    // title section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section 1" //sections[section]
    }
    
    // number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //sections.count
    }
    
    // heigth of section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    // view for section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HeaderCell") //as! HeaderViewCell
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PrototypViewCell
        cell.textLabel?.text = sectionData[indexPath.section]?[indexPath.row]

        return cell
    }
    
    
    /*
    // MARK: UIImagePickerControllerDelegate
    
    @IBAction func selectedPhoto(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")  }
        
        dismiss(animated: true, completion: nil)
    }
 
 
 
 
    */
    
    // MARK: button Exit
    
    @IBAction func buttonExit(_ sender: Any) {
        
        let enterLoginStoryboard = UIStoryboard.init(name: "EnterAndRegistration", bundle: nil)
        let vc = enterLoginStoryboard.instantiateViewController(withIdentifier: "EnterLoginViewController") as UIViewController
        present(vc, animated: true, completion: nil)
        
    }
    
    // Tap gesture image
    
    @IBAction func goToPhoto(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
        
        
        
        print("go to image")
    }
    
    
    
    
    
}
