//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var calculationFormulaStackView: UIStackView!
    
    private let numberFormatter = NumberFormatter()
    private var isPrevResult = false
    private var inputFormula = ""
    private let initialNumber = 0
    private let maximumPointDigits = 5
    private var isFirstArithmeticFormula: Bool {
        return calculationFormulaStackView.subviews.count == 0
    }
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = maximumPointDigits
    }
}

// MARK: - Button Action
extension CalculatorViewController {
    @IBAction func didTappedOperators(_ sender: UIButton) {
        guard currentOperandLabel.text != "\(initialNumber)", isPrevResult == false else {
            currentOperatorLabel.text = isFirstArithmeticFormula ? "" : sender.currentTitle
            return
        }
        
        addArithmetic()
        currentOperatorLabel.text = sender.currentTitle
        currentOperandLabel.text = "\(initialNumber)"
    }
    
    @IBAction func didTappedCalculate(_ sender: UIButton) {
        guard isPrevResult == false else { return }
        
        addArithmetic()
        
        guard let result = calculateResult() else { return }
        
        currentOperatorLabel.text = ""
        currentOperandLabel.text = "\(result)"
        isPrevResult = true
    }
    
    @IBAction func didTappedNumbers(_ sender: UIButton) {
        guard let currentOperand = currentOperandLabel.text?.replacingOccurrences(of: ",", with: ""), let insertedNumber = sender.currentTitle else { return }
        
        if isPrevResult {
            currentOperandLabel.text = "\(initialNumber)"
            isPrevResult = false
        }
        
        guard isOverMaximumDigits(currentOperand, insertedNumber) == false,
              isOverMaximumPointDigits(currentOperand, insertedNumber) == false else { return }
        
        currentOperandLabel.text = setUpOperandLabelText(currentOperand, insertedNumber)
    }
    
    @IBAction func didTappedMenus(_ sender: UIButton) {
        guard let insertedMenu = sender.currentTitle,
                let menu = Menus(rawValue: insertedMenu) else { return }
        
        switch menu {
        case .allClear:
            clearCalculationFormulaStackView()
            inputFormula = ""
            currentOperatorLabel.text = ""
            fallthrough
            
        case .clearElement:
            currentOperandLabel.text = "\(initialNumber)"
            
        case .changeSign:
            changeOperandSign()
        }
    }
}

// MARK: - Calculate Method
extension CalculatorViewController {
    private func changeOperandSign() {
        guard let currentOperandString = currentOperandLabel.text,
              Int(currentOperandString) != initialNumber else { return }
        
        let isNegativeNumber = currentOperandString.hasPrefix("-")
        
        currentOperandLabel.text = isNegativeNumber ? String(currentOperandString.dropFirst()) : "-\(currentOperandString)"
    }
    
    private func calculateResult() -> String? {
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parse(from: inputFormula)
        
        guard let result = numberFormatter.string(from: formula.result() as NSNumber) else { return nil }
        
        return result
    }
    
    private func addInputFormula(_ currentOperandString: String?) {
        inputFormula += currentOperatorLabel.text ?? ""
        inputFormula += currentOperandString ?? ""
    }
    
    private func makeRefinementOperand() -> String? {
        guard let currentOperandString = currentOperandLabel.text, let operand = Double(currentOperandString) else { return nil }
        
        let isDecimalPointNumber = operand != floor(operand)
        
        return isDecimalPointNumber ? "\(operand)" : "\(Int(operand))"
    }
    
    private func isOverMaximumDigits(_ currentOperand: String, _ insertedNumber: String) -> Bool {
        let operand = currentOperand.replacingOccurrences(of: ".", with: "")
        let appendedOperandCount = (operand + insertedNumber).count
        
        return appendedOperandCount > 20
    }
    
    private func isOverMaximumPointDigits(_ currentOperand: String, _ insertedNumber: String) -> Bool {
        guard currentOperand.contains(".") else { return false }
        guard let pointNumber = currentOperand.components(separatedBy: ".").last else { return false }
        
        let appendedPointNumber = (pointNumber + insertedNumber).count
        
        return appendedPointNumber > 5
    }
    
    private func setUpOperandLabelText(_ currentOperand: String, _ insertedNumber: String) -> String? {
        let isSubstitutionOperand = (Int(currentOperand) == initialNumber) && (insertedNumber != ".")
        
        if isSubstitutionOperand {
            return "\(Int(insertedNumber) ?? initialNumber)"
        }
        
        if insertedNumber == "." {
            return currentOperand.contains(".") ? currentOperand : currentOperand + "."
        }
        
        if currentOperand.contains(".") && Double(insertedNumber) == 0.0 {
            return currentOperand + insertedNumber
        }

        let appendedOperand = currentOperand + insertedNumber
        let appenedOperandAsNumber = numberFormatter.number(from: appendedOperand) ?? initialNumber as NSNumber
        
        return numberFormatter.string(from: appenedOperandAsNumber)
    }
}

// MARK: - UI Method
extension CalculatorViewController {
    private func addArithmetic() {
        let operand = makeRefinementOperand()
        
        addFormulaStackView(operand)
        addInputFormula(operand)
        scrollView.scrollToBottom(animated: true)
    }
    
    private func addFormulaStackView(_ currentOperandString: String?){
        let arithmeticStackView = ArithmeticStackView(currentOperatorLabel.text, currentOperandString)
        
        calculationFormulaStackView.addArrangedSubview(arithmeticStackView)
        scrollView.layoutIfNeeded()
    }
    
    private func clearCalculationFormulaStackView() {
        calculationFormulaStackView.subviews.forEach { $0.removeFromSuperview() }
    }
}
