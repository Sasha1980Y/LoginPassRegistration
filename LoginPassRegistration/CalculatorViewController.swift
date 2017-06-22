//
//  CalculatorViewController.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/21/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit
import Darwin

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var tabloLabel: UILabel!
    var a: Double? = nil
    var b: Double? = nil
    var c: Double? = nil
    var isEdit = false
    var countOperation = 0
    var valForOperation = "a"
    
    
    
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        tabloLabel.text = numberFormat.str
         */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        let condition = sender.titleLabel?.text
        
        
        switch condition! {
            case "1", "2", "3","4", "5", "6", "7", "8", "9", "0":
                
                if countOperation >= 1 && isEdit == false {
                    
                    tabloLabel.text = "0"
                    isEdit = true
                    
                    
                }

                
                
                
                if tabloLabel.text == "0"  {
                tabloLabel.text = condition
                } else {
                tabloLabel.text = tabloLabel.text! + condition!
            }
            case ".":
                
                
                
                if tabloLabel.text == "0" {
                tabloLabel.text = "0."
                } else {
                tabloLabel.text = tabloLabel.text! + condition!
            }
            case "CE": tabloLabel.text = "0"
                countOperation = 0
                isEdit = false
            case "+/-":
                
                if tabloLabel.text == "0"  {
                    return
                }
                
                if !(tabloLabel!.text?.characters.contains("-"))! {
                tabloLabel.text = "-" + tabloLabel.text!
            } else {
                tabloLabel.text?.remove(at: (tabloLabel.text?.startIndex)!)
                
            }
            
            
            default: print("def")
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        
        let sign = sender.titleLabel?.text
        
        isEdit = false
        
        if countOperation == 0 {
            a = Double( tabloLabel.text!)
            
        } else {
            
            
            
            switch valForOperation  {
                case "*": tabloLabel.text = String(a! * Double(tabloLabel.text!)!)
                case "-": tabloLabel.text = String(a! - Double(tabloLabel.text!)!)
                case "+": tabloLabel.text = String(a! + Double(tabloLabel.text!)!)
            default: if Double(tabloLabel.text!) == 0 {
                tabloLabel.text = "div 0"
            } else {
                tabloLabel.text = String(a! / Double(tabloLabel.text!)!)
                }
                
            }
            a = Double( tabloLabel.text!)
        }
        countOperation += 1
        valForOperation = sign!
        
        
    }
    
    
    func operations(a: Double, b: Double, operation: CharOperation) -> Double {
        
        var result: Double = 0
        
        switch operation {
        case .minus: result = a - b
        case .plus: result = a + b
        case .multiplication: result = a * b
        case .division: result = a / b
        default: break
            
        }
        return result
        
    }
    
    func sqrtMy(a: Double) -> Double {
        var result: Double = 0
        
        result = Darwin.sqrt(a)
        return result
    }
    func addSymbol(label: String, char: String) -> String {
        var result = ""
        if label == "0" {
            result = char
        } else {
            result = label + char
        }
        
        
        return result
    }
    
    @IBAction func sqrt(_ sender: Any) {
        
        let a = Double(tabloLabel.text!)
        let b = sqrtMy(a: a!)
        tabloLabel.text = String(b)
        
        countOperation = 0
        isEdit = false
        
        
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        
        b = Double( tabloLabel.text!)
        var result: Double = 0
        var op: CharOperation = .sqrt
        
        switch valForOperation {
        case "+": op = .plus
        case "-": op = .minus
        case "/": op = .division
        case "*": op = .multiplication
            
        default:
            break
        }
        
        result = operations(a: a!, b: b!, operation: op)
        tabloLabel.text = String(result)
        
        
    }
    
    
    
    
}

enum CharOperation {
    case plus, minus, multiplication, division, sqrt
    
}

