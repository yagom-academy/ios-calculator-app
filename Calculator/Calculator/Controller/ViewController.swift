//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputNumberButtons: [UIButton]!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var inputString: String = "0"
    
    var presentNumberString: String = ""
    var opperArray: [String] = []
    var opperString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if opperArray.count > 0 {
            opperString += opperArray.removeLast()
            inputString += presentNumberString
            inputString += " \(opperString) "
            presentNumberString = ""
            
            print("presentNumberArray: ", presentNumberString)
            print("inputStirng: ", inputString)
            print( "\(opperString) ")
            
            opperString = ""
            opperArray = []
            
            presentNumberString += "\(digit)"
            
        } else {
            presentNumberString += "\(digit)"
            numberLabel.text = "\(presentNumberString)"

            print(presentNumberString)
        }
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if ["+", "−", "÷", "×"].contains(digit) {
            opperArray.append(" \(digit) ")
            operatorLabel.text = "\(digit)"
            
            print(opperArray)
            
        } else if ["="].contains(digit) {
            inputString += presentNumberString
            
            print(inputString)
            
            var parse = ExpressionParser.parse(from: (inputString))
            let result = try! parse.result()
            numberLabel.text = "\(result)"

            print(result)
            print("----")
            
            inputString = "0"
            presentNumberString = ""
        }
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if ["AC"].contains(digit) {
            inputString = "0"
            presentNumberString = "0"
    
        } else if ["CE"].contains(digit) {
            presentNumberString = "0"

            print(presentNumberString)

        } else if ["⁺⁄₋"].contains(digit) {
            presentNumberString = String(Int(presentNumberString)! * -1)
            
            print(presentNumberString)
            
        }
    }
    
}

