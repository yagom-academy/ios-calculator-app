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
    
    private var notFormattedOperand = "0"
    private var invalidCheckInputedOperand: Bool {
        if notFormattedOperand.components(separatedBy: [",", "-"]).joined().count <= 14 {
            return true
        } else {
            return false
        }
    }
    private let calculatorController = CalculatorController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard invalidCheckInputedOperand else {
            return
        }
        
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        notFormattedOperand = notFormattedOperand + number
        operandLabel.text = changeNumberFormatter(insertedNumber: number)
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard !notFormattedOperand.contains(".") else {
            return
        }
        
        notFormattedOperand = notFormattedOperand + "."
        operandLabel.text = notFormattedOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        notFormattedOperand = "0"
        
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
        if notFormattedOperand == "0" {
            return
        }
        if notFormattedOperand.contains("-") {
            notFormattedOperand.remove(at: notFormattedOperand.startIndex)
        } else {
            notFormattedOperand.insert("-", at: notFormattedOperand.startIndex)
        }
        operandLabel.text = notFormattedOperand
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        clearEntry()
    }
    
    @IBAction func touchUPEqualButton(_ sender: UIButton) {
        if operatorLabel.text == "" {
            return
        }
        addFormula()
        operatorLabel.text = ""
        operandLabel.text = calculatorController.calculate()
    }
    
    func reset() {
        notFormattedOperand = "0"
        operandLabel.text = notFormattedOperand
        operatorLabel.text = ""
        allClear()
    }
    
    func addFormula() {
        let stackView = UIStackView()
        
        guard let `operator` = operatorLabel.text else {
            return
        }
        
        let insertingOperatingLabel = UILabel()
        insertingOperatingLabel.textColor = UIColor.white
        insertingOperatingLabel.text = `operator`
        insertingOperatingLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        stackView.addArrangedSubview(insertingOperatingLabel)
        
        guard let operand = operandLabel.text else {
            return
        }
        
        let insertingOperandLabel = UILabel()
        insertingOperandLabel.textColor = UIColor.white
        insertingOperandLabel.text = operand
        insertingOperandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        stackView.addArrangedSubview(insertingOperandLabel)
        
        calculationHistoryStackView.addArrangedSubview(stackView)
        
        calculatorController.insertFormula(operator: `operator`, operand: operand.components(separatedBy: [","]).joined())
        
        autoScrollDown()
    }
    
    func allClear() {
        for subview in calculationHistoryStackView.subviews {
            subview.removeFromSuperview()
        }
        calculatorController.resetFormula()
    }
    
    func clearEntry() {
        notFormattedOperand = "0"
        operandLabel.text = notFormattedOperand
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
    
    func changeNumberFormatter(insertedNumber: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 15

        guard let number = Double(notFormattedOperand),
              let result = numberFormatter.string(from: NSNumber(value: number)) else {
            return ""
        }
        
        if notFormattedOperand.contains(".") {
            if insertedNumber == "0" || insertedNumber == "00" {
                return notFormattedOperand
            }
        }
        return result
    }
    
}
