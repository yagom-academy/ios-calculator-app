//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    @IBOutlet var operandButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var convertingSignButton: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var totalVerticalStackView: UIStackView!
    @IBOutlet var lowerHorizontalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
    }
    
    // MARK: Label Changing Methods
    @IBAction func operandButtonsClicked(_ sender: UIButton) {
        guard var currentOperand = currentOperandLabel.text else {
            return
        }
        
        guard currentOperand.count < 20 else {
            return
        }
        
        if currentOperand == Number.zero.rawValue, sender.tag == 10 {
            return
        } else if currentOperand == Number.zero.rawValue, sender.tag != 11 {
            currentOperand = ""
        } else if currentOperand == "-\(Number.zero.rawValue)" {
            currentOperand = "-"
        } else if currentOperand.contains(Number.decimalPoint.rawValue), sender.tag == 11 {
            return
        }
        
        Number.allCases.forEach { number in
            guard (0..<12) ~= sender.tag  else {
                return
            }
            
            if String(sender.tag) == number.rawValue {
                currentOperand += number.rawValue
            } else if sender.tag == 10, number == .doubleZero {
                currentOperand += Number.doubleZero.rawValue
            } else if sender.tag == 11, number == .decimalPoint {
                currentOperand += Number.decimalPoint.rawValue
            }
        }
        currentOperandLabel.text = currentOperand
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
        guard var currentNumber = currentOperandLabel.text else {
            return
        }
        
        if currentNumber.contains(Operator.subtract.rawValue) {
            let minusSign = currentNumber.first
            currentNumber = currentNumber.filter{ $0 != minusSign }
        } else {
            currentNumber = "-\(currentNumber)"
        }
        currentOperandLabel.text = currentNumber
    }
    
    @IBAction func clearEntryButtonClicked(_ sender: UIButton) {
        currentOperandLabel.text = Number.zero.rawValue
    }
}

