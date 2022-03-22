//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
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
    
    @IBAction func showNumberOnLabel(_ sender: UIButton) {
        guard var currentNumber = currentNumberLabel.text else {
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
    @IBAction func showOperatorOnLabel(_ sender: UIButton) {
        guard var currentOperator = currentOperatorLabel.text else {
            return
        }
        
        switch sender.tag {
        case 0:
            currentOperator = String(Operator.add.rawValue)
        case 1:
            currentOperator = String(Operator.subtract.rawValue)
        case 2:
            currentOperator = String(Operator.multiply.rawValue)
        case 3:
            currentOperator = String(Operator.divide.rawValue)
        default:
            print("에러호출")
        }
        currentOperatorLabel.text = currentOperator
    }
}

