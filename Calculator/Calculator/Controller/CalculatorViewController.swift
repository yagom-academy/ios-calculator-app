//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculationHistoryStackView: UIStackView!
    @IBOutlet weak var calculationHistoryScrollView: UIScrollView!
    
    private var rawOperand = "0"
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
        resetCalcurator()
    }
}

// MARK: - Actions

extension CalculatorViewController {
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard checkNumberOfInputs, isNotCalculated else {
            return
        }
        guard let number = sender.titleLabel?.text else {
            return
        }
        rawOperand = rawOperand + number
        operandLabel.text = changeNumberFormatter(insertedNumber: number)
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard !rawOperand.contains("."), isNotCalculated else {
            return
        }
        rawOperand = rawOperand + "."
        operandLabel.text = rawOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text != "NaN" else {
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
        guard rawOperand != "0", isNotCalculated else {
            return
        }
        if rawOperand.contains("-") {
            rawOperand.remove(at: rawOperand.startIndex)
        } else {
            rawOperand.insert("-", at: rawOperand.startIndex)
        }
        operandLabel.text = rawOperand
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetCalcurator()
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
        if operatorLabel.text == "", hasCalculated {
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
        operandLabel.text = operandLabel.text
        addCurrentFormulaStack()
    }
    
    func resetCalcurator() {
        rawOperand = "0"
        operandLabel.text = rawOperand
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
        rawOperand = "0"
        operandLabel.text = rawOperand
    }
    
    func changeNumberFormatter(insertedNumber: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 15
        guard let number = Double(rawOperand),
              let result = numberFormatter.string(from: NSNumber(value: number)) else {
            return ""
        }
        if rawOperand.contains(".") {
            if insertedNumber == "0" || insertedNumber == "00" {
                return rawOperand
            }
        }
        return result
    }
}
