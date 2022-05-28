//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var operandStorage = CalculatorItemQueue<Double>()
    var operatorStorage = CalculatorItemQueue<Operator>()
    var currentString: String = ""
    
    // Buttons - Numbers
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    
    // Buttons - Symbols
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    // Buttons - Functions
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    
    
    // Labels - Associate with Result
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func clearCurrentCalculation(_ sender: UIButton) {
        currentString = ""
        signLabel.text = ""
        resultLabel.text = "0"
        operandStorage.clear()
        operatorStorage.clear()
    }
    
    @IBAction func addOperatorIntoEquation(_ sender: UIButton) {
        if currentString.isEmpty {
            print("Hello")
        } else {
            switch sender {
            case plusButton:
                signLabel.text = "+"
            case minusButton:
                signLabel.text = "-"
            case multiplyButton:
                signLabel.text = "*"
            case divideButton:
                signLabel.text = "/"
            default:
                signLabel.text = ""
            }
        }
    }
}

