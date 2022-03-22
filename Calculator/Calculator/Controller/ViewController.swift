//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var convertingSignButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Label Changing Methods
    @IBAction func numberButtonsClicked(_ sender: UIButton) {
        guard var currentNumber = currentNumberLabel.text else {
            return
        }
        
        if currentNumber == Number.zero.rawValue, sender.tag == 10 {
            return
        } else if currentNumber == Number.zero.rawValue, sender.tag != 11 {
            currentNumber = ""
        } else if currentNumber.contains(Number.decimalPoint.rawValue), sender.tag == 11 {
            return
        }
        
        Number.allCases.forEach { number in
            guard (0..<12) ~= sender.tag  else {
                return
            }
            
            if String(sender.tag) == number.rawValue {
                currentNumber += number.rawValue
            } else if sender.tag == 10, number == .doubleZero {
                currentNumber += Number.doubleZero.rawValue
            } else if sender.tag == 11, number == .decimalPoint {
                currentNumber += Number.decimalPoint.rawValue
            }
            currentNumberLabel.text = currentNumber
        }
    }
    
    @IBAction func operatorButtonsClicked(_ sender: UIButton) {
        guard var currentOperator = currentOperatorLabel.text else {
            return
        }
        
        switch sender.tag {
        case 0:
            currentOperator = "\(Operator.add.rawValue)"
        case 1:
            currentOperator = "\(Operator.subtract.rawValue)"
        case 2:
            currentOperator = "\(Operator.multiply.rawValue)"
        case 3:
            currentOperator = "\(Operator.divide.rawValue)"
        default:
            print("에러호출")
        }
        currentOperatorLabel.text = currentOperator
    }
    
    @IBAction func signConvertingButtonClicked(_ sender: UIButton) {
        guard var currentNumber = currentNumberLabel.text else {
            return
        }
        
        if currentNumber.contains(Operator.subtract.rawValue) {
            let minusSign = currentNumber.first
            currentNumber = currentNumber.filter{ $0 != minusSign }
        } else {
            currentNumber = "-\(currentNumber)"
        }
        currentNumberLabel.text = currentNumber
    }
    
    @IBAction func clearEntryButtonClicked(_ sender: UIButton) {
        currentNumberLabel.text = Number.zero.rawValue
    }
}

