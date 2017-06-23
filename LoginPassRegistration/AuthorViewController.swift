//
//  AuthorTableViewController.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/20/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var list =  [String]()
    let sectionView = HeaderView.loadNib()
    var stringForList = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        listItenRandomAdd()
        tupExitButton()
        tupImageViewHeader()
        
    
        // give
        //sectionView.headerViewButton.addTarget(self, action: #selector(scrollViewDidScroll(_:)), for: .touchUpInside)
        // round image
        self.sectionView.headerViewImage.layer.cornerRadius = self.sectionView.headerViewImage.frame.size.width / 2
        self.sectionView.headerViewImage.clipsToBounds = true
        
        
        
        
        
    }
    
    // scroll view to down go not
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset = CGPoint.zero
        }
    }
    
    // change status bar style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    // create array
    func listItenRandomAdd() {
        for _ in 1...5 {
            for index in (1...arc4random_uniform(3)+1) {
                stringForList += "test \(index)" + "\r"
            }
            list.append(stringForList)
            stringForList = ""
        }
    }
    // create table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cellCalc = tableView.dequeueReusableCell(withIdentifier: "Calculator", for: indexPath)
            cellCalc.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cellCalc.selectionStyle = UITableViewCellSelectionStyle.blue
            return cellCalc
        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //tableView.rowHeight = 180
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let cellCalc = tableView.dequeueReusableCell(withIdentifier: "Calculator", for: indexPath)
        cellCalc.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
        
        }
    }
    // when selected cellCalc
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard.init(name: "Calculator", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CalculatorViewController")
            present(vc, animated: true, completion: nil)
            //navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionView
    }
    
    
    // go to enter login and password screen
    func exitButton(sender: UITapGestureRecognizer) {
        let enterLoginStoryboard = UIStoryboard.init(name: "EnterAndRegistration", bundle: nil)
        let vc = enterLoginStoryboard.instantiateViewController(withIdentifier: "EnterLoginViewController") as UIViewController
        present(vc, animated: true, completion: nil)

        
    }
    // create tup gesture
    func tupExitButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.exitButton(sender:)))
        sectionView.headerViewButton.addGestureRecognizer(tapGesture)
    }
    
    
    
    // Tap gesture image go to photo gallery
    func tupImageViewHeader() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.goToPhoto(_:)))
        sectionView.headerViewImage.addGestureRecognizer(tapGesture)
    }
    
    
    
    func goToPhoto(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage  else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        sectionView.headerViewImage.image = selectImage
        
        
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    
    
}
