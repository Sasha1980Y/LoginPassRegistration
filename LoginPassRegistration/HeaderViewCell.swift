//
//  HeaderViewCell.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/14/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

protocol HeaderViewCellDelegate {
    func setupButton()
}

class HeaderViewCell: UITableViewCell {
    

    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    func setupButton () {
        exitButton.backgroundColor = UIColor.blue
        exitButton.bounds = CGRect(x: 10, y: 10, width: 50, height: 50)
        exitButton.center = CGPoint(x: 25, y: 25)
        self.addSubview(exitButton)
    }
    
    /*
    func setupButton() {
        button1 = UIButton.init(type: UIButtonType.system)
        button1.setTitle("Animate Auto Layout", for: UIControlState.normal)
        view.addSubview(button1)
        button1.bounds = CGRect(x: 0, y: 0, width: 300, height: 80)
        button1.center = CGPoint(x: 200, y: 200)
        button1.backgroundColor = UIColor.blue
        
    }
    
    */
    
    
}
