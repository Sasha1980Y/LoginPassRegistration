//
//  SupportingFile.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/5/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

// MARK: class user
class User {
    var login: String!
    var password: String!
    required init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    required init(userInfo: [String: Any]) {
        self.login = userInfo["login"] as! String
        self.password = userInfo["password"] as! String
    }
}

// MARK: class for work with data
class WordWithData: UIViewController {

    // MARK: save user
    class func saveUser(userToSave: User) {
        let userInfo: [String: Any] = ["login": userToSave.login, "password": userToSave.password]
        UserDefaults.standard.set(userInfo, forKey: userToSave.login)

    }

    // MARK: get user
    class func getUser(login: String, password: String) -> User? {
        guard let userInfo = UserDefaults.standard.value(forKey: login) as? [String: Any] else {
           return nil
        }
        if let userPassword = userInfo["password"] as? String, userPassword != password {
            return nil
        } else {
            return User.init(login: login, password: password)
        }
    }
    
    // MARK: user exist or not
    class func userAlreadyExists(login: String) -> Bool {
        guard (UserDefaults.standard.value(forKey: login) as? [String:Any]) != nil else {
            return false
        }
        return true
    }

}
