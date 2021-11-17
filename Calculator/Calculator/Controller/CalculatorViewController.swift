//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculationHistoryStackView: UIStackView!
    @IBOutlet weak var calculationHistoryScrollView: UIScrollView!
    
    var inputedOperand = "0"
    var invalidCheckInputedOperand: Bool {
        if inputedOperand.count <= 15 {
            return true
        } else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard invalidCheckInputedOperand else {
            return
        }
        
        guard let tapedNumber = sender.titleLabel?.text else {
            return
        }
        
        if inputedOperand == "0" {
            if tapedNumber == "0" || tapedNumber == "00" {
                return
            } else {
                inputedOperand = tapedNumber
                operandLabel.text = inputedOperand
                return
            }
        }
        
        inputedOperand = inputedOperand + tapedNumber
        operandLabel.text = changeNumberFormatter(target: inputedOperand)
        
        if tapedNumber == "0" {
            operandLabel.text = inputedOperand
        }
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard !inputedOperand.contains(".") else {
            return
        }
        
        inputedOperand = inputedOperand + "."
        operandLabel.text = inputedOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        inputedOperand = "0"
        
        if operandLabel.text == "0" {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        if calculationHistoryStackView.subviews.isEmpty {
            operatorLabel.text = ""
        }
        
        addFormula()
        operatorLabel.text = sender.titleLabel?.text
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpTogglePlusMinusButton(_ sender: UIButton) {
        if var operand = operandLabel.text {
            if operand == "0" {
                return
            }
            
            if operand.contains("-") {
                operand.remove(at: operand.startIndex)
            } else {
                operand.insert("-", at: operand.startIndex)
            }
            operandLabel.text = operand
        }
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        clearEntry()
    }
    
    func reset() {
        inputedOperand = "0"
        operandLabel.text = inputedOperand
        operatorLabel.text = ""
        allClear()
    }
    
    func addFormula() {
        let stackView = UIStackView()
        
        if let `operator` = operatorLabel.text {
            let insertingOperatingLabel = UILabel()
            insertingOperatingLabel.textColor = UIColor.white
            insertingOperatingLabel.text = `operator`
            insertingOperatingLabel.font = UIFont.preferredFont(forTextStyle: .title3)
            
            stackView.addArrangedSubview(insertingOperatingLabel)
        }
        
        guard let operand = operandLabel.text else {
            return
        }
        
        let insertingOperandLabel = UILabel()
        insertingOperandLabel.textColor = UIColor.white
        insertingOperandLabel.text = operand
        insertingOperandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        stackView.addArrangedSubview(insertingOperandLabel)
        
        calculationHistoryStackView.addArrangedSubview(stackView)
        autoScrollDown()
    }
    
    func allClear() {
        for subview in calculationHistoryStackView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func clearEntry() {
        inputedOperand = "0"
        operandLabel.text = inputedOperand
    }
    
    func autoScrollDown() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1 ) {
            self.calculationHistoryScrollView
                .scrollRectToVisible(CGRect(x: 0,
                                            y: self.calculationHistoryScrollView.contentSize.height
                                                - self.calculationHistoryScrollView.bounds.height,
                                            width: self.calculationHistoryScrollView.bounds.size.width,
                                            height: self.calculationHistoryScrollView.bounds.size.height),
                                     animated: true)
        }
    }
    
    func changeNumberFormatter(target: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 15

        guard let number = Double(target),
              let result = numberFormatter.string(for: number) else {
            return ""
        }
        return result
    }
    
}

