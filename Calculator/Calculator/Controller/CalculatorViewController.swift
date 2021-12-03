//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import OSLog

class CalculatorViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculationHistoryStackView: UIStackView!
    @IBOutlet weak var calculationHistoryScrollView: UIScrollView!
    
    private var rawOperand = ""
    private var hasCalculated = false
    private var checkNumberOfInputs: Bool {
        if rawOperand.components(separatedBy: [",", "-"]).joined().count <= 14 {
            return true
        } else {
            return false
        }
    }
    private var isNotCalculated: Bool {
        hasCalculated == false
    }
    private let calculatorController = CalculatorController()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
}

// MARK: - Actions

extension CalculatorViewController {
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard checkNumberOfInputs, isNotCalculated else {
            return
        }
        guard let InputedNumber = sender.titleLabel?.text else {
            return
        }
        guard rawOperand != "" || InputedNumber != "0",
              rawOperand != "" || InputedNumber != "00" else {
            return
        }
        rawOperand = rawOperand + InputedNumber
        operandLabel.text = changeNumberFormatter(insertedNumber: InputedNumber)
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard !rawOperand.contains("."), isNotCalculated else {
            return
        }
        if rawOperand == "" {
            rawOperand = "0"
        }
        rawOperand = rawOperand + "."
        operandLabel.text = rawOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text != "NaN" else {
            os_log(.error, log: .error, LogMessage.resetNaN)
            return
        }
        rawOperand = "0"
        guard isNotCalculated else {
            startNewCalculation()
            operandLabel.text = "0"
            clearEntry()
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        guard operandLabel.text != "0" else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        if calculationHistoryStackView.subviews.isEmpty {
            operatorLabel.text = ""
        }
        addCurrentFormulaStack()
        operatorLabel.text = sender.titleLabel?.text
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpTogglePlusMinusButton(_ sender: UIButton) {
        guard var currentOperand = operandLabel.text,
                  currentOperand != "0", isNotCalculated else {
            return
        }
        if currentOperand.contains("-") {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-" + currentOperand
        }
        rawOperand = currentOperand
        operandLabel.text = currentOperand
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetCalculator()
        hasCalculated = false
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        clearEntry()
        if hasCalculated {
            clearAll()
            hasCalculated = false
        }
    }
    
    @IBAction func touchUPEqualButton(_ sender: UIButton) {
        guard calculationHistoryStackView.arrangedSubviews.count > 0 else {
            os_log(.error, log: .error, LogMessage.canNotCalculate)
            return
        }
        addCurrentFormulaStack()
        operatorLabel.text = ""
        operandLabel.text = calculatorController.calculate()
        hasCalculated = true
        rawOperand = operandLabel.text?.replacingOccurrences(of: ",", with: "") ?? ""
    }
    
    func startNewCalculation() {
        hasCalculated = false
        clearAll()
        addCurrentFormulaStack()
    }
    
    func resetCalculator() {
        rawOperand = ""
        operandLabel.text = "0"
        operatorLabel.text = ""
        clearAll()
    }
    
    private func addCurrentFormulaStack() {
        guard let `operator` = operatorLabel.text,
              let operand = operandLabel.text  else {
            return
        }
        let formulaStackView = addFormulaStackView(operand: operand, operator: `operator`)
        calculationHistoryStackView.addArrangedSubview(formulaStackView)
        calculatorController.insertFormula(operator: `operator`,
                                           operand: operand.replacingOccurrences(of: ",", with: ""))
        scrollToBottom(calculationHistoryScrollView)
    }
    
    private func addFormulaStackView(operand: String, operator: String) -> UIStackView {
        let formulaStackView = FormulaStackView()
        guard calculationHistoryStackView.subviews.count > 0 else {
            formulaStackView.addLabel(operand)
            return formulaStackView
        }
        formulaStackView.addLabel(`operator`)
        formulaStackView.addLabel(operand)
        return formulaStackView
    }
    
    private func scrollToBottom(_ view: UIScrollView) {
        calculationHistoryScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0,
                                   y: calculationHistoryScrollView.contentSize.height
                                          - calculationHistoryScrollView.frame.height)
        view.setContentOffset(bottomOffset, animated: false)
    }
    
    func clearAll() {
        for subview in calculationHistoryStackView.subviews {
            subview.removeFromSuperview()
        }
        calculatorController.resetFormula()
    }
    
    func clearEntry() {
        rawOperand = ""
        operandLabel.text = "0"
    }
    
    func changeNumberFormatter(insertedNumber: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 15
        guard let number = Double(rawOperand),
              let result = numberFormatter.string(from: NSNumber(value: number)) else {
            return ""
        }
        guard !rawOperand.contains("."),
              insertedNumber != "0" || insertedNumber != "00" else {
            return rawOperand
        }
        return result
    }
}
