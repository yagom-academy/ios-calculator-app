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
    @IBOutlet weak var convertingSignButton: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var verticalStackView: UIStackView!
    var isFirstOperand = true
    var isOperandEntered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
    }
    
    // MARK: Operand Button Method
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
        } else if currentOperand.hasPrefix("−\(Number.zero.rawValue)") {
            currentOperand = "−"
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
        
        isOperandEntered = true
        currentOperandLabel.text = currentOperand
    }
    
    // MARK: Operator Button Methods
    @IBAction func operatorButtonsClicked(_ sender: UIButton) {
        
        guard var currentOperator = currentOperatorLabel.text else {
            return
        }
        
        switch sender.tag {
        case 0:
            currentOperator = operatorButtons[0].titleLabel?.text ?? ""
        case 1:
            currentOperator = operatorButtons[1].titleLabel?.text ?? ""
        case 2:
            currentOperator = operatorButtons[2].titleLabel?.text ?? ""
        case 3:
            currentOperator = operatorButtons[3].titleLabel?.text ?? ""
        default:
            print("에러호출")
        }
        
        currentOperatorLabel.text = currentOperator
        
        guard isOperandEntered == true else {
            return
        }
        
        insertLabelToHorizontalStackView()
        currentOperandLabel.text = Number.zero.rawValue
        isOperandEntered = false
    }
    
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        guard verticalStackView.arrangedSubviews.last != nil else {
            return
        }
        
    }
    
    // MARK: Extra Button Methods
    @IBAction func allClearButtonClicked(_ sender: UIButton) {
        guard verticalStackView.arrangedSubviews.last != nil else {
            return
        }

        for view in verticalStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
        isFirstOperand = true
    }
    
    @IBAction func clearEntryButtonClicked(_ sender: UIButton) {
        currentOperandLabel.text = Number.zero.rawValue
    }
    
    @IBAction func signConvertingButtonClicked(_ sender: UIButton) {
        guard var currentNumber = currentOperandLabel.text else {
            return
        }
        
        if currentNumber.contains(Operator.subtract.rawValue) {
            let minusSign = currentNumber.first
            currentNumber = currentNumber.filter{ $0 != minusSign }
        } else {
            currentNumber = String(Operator.subtract.rawValue) + currentNumber
        }
        
        currentOperandLabel.text = currentNumber
    }
    
    // MARK: StackView Related Method
    func insertLabelToHorizontalStackView() {
        let label = UILabel()
        
        guard let operatorLabelText = currentOperatorLabel.text else {
            return
        }
        
        guard let operandLabelText = currentOperandLabel.text else {
            return
        }
        
        if isFirstOperand == true {
            label.text = "\(operandLabelText)"
            label.textColor = .white
            verticalStackView.addArrangedSubview(label)
            isFirstOperand = false
        } else {
            label.text = "\(operatorLabelText) \(operandLabelText)"
            label.textColor = .white
            verticalStackView.addArrangedSubview(label)
        }
    }
}

