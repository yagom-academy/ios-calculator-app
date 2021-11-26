//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    private var calculatorModel = Calculator() {
        didSet {
            addCurrentInputToFormulaHistory()
            updateCurrentInputLabel()
            formulaHistoryScrollView.scrollToBottom()
        }
    }
    
    @IBOutlet weak private var formulaHistoryScrollView: UIScrollView!
    @IBOutlet weak private var formulaHistoryStackView: UIStackView!
    @IBOutlet weak private var currentInputOperandLabel: UILabel!
    @IBOutlet weak private var currentInputOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentInputLabel()
        removeAllFormulaHistory()
    }
    
    @IBAction private func touchNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        calculatorModel.touchNumberButton(number)
    }
    
    @IBAction private func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else {
            return
        }
        calculatorModel.touchOperatorButton(operatorSymbole)
    }
    
    @IBAction private func touchButton(_ sender: UIButton) {
        guard let symbol = sender.titleLabel?.text else {
            return
        }
        
        switch symbol {
        case Buttons.AC:
            calculatorModel.touchAllClearButton()
        case Buttons.CE:
            calculatorModel.touchClearEntryButton()
        case Buttons.sign:
            calculatorModel.touchSignChangeButton()
        case Buttons.equal:
            calculatorModel.touchEvaluateButton()
        case Buttons.dot:
            calculatorModel.touchPointButton()
        default:
            return
        }
        
    }
    
    private func addCurrentInputToFormulaHistory() {
        removeAllFormulaHistory()
        calculatorModel.mathExpression.forEach { eachForm in
            let stackView = UIStackView()
            stackView.spacing = 8.0
            
            let operatorSignLabelView = UILabel()
            operatorSignLabelView.text = eachForm.operatorSymbole
            operatorSignLabelView.textColor = .white
            
            let operandLabelView = UILabel()
            operandLabelView.text = formatNumberForStackView(eachForm.operandNumber)
            operandLabelView.textColor = .white
            
            stackView.addArrangedSubview(operatorSignLabelView)
            stackView.addArrangedSubview(operandLabelView)
            
            formulaHistoryStackView.addArrangedSubview(stackView)
        }
    }
    
    private func formatNumberForCurrentLabel(_ number: String) -> String {
        let numberFormatter = initNumberFormatter()
        
        guard let result = numberFormatter.string(for: Double(number)) else {
            return number
        }
        
        guard let numberPointIndex = number.firstIndex(of: Character(Labels.pointSymbole)) else {
            return result
        }
        
        guard let resultPointIndex = result.firstIndex(of: Character(Labels.pointSymbole)) else {
            let formattedResult = result + String(number[numberPointIndex...])
            return formattedResult
        }
        
        let formattedNumberIntegerDigit = String(result[..<resultPointIndex])
        let userInputNumberFractionDigit = String(number[numberPointIndex...])
        
        let formattedResult = formattedNumberIntegerDigit + userInputNumberFractionDigit
        
        return formattedResult
    }
    
    private func formatNumberForStackView(_ number: String) -> String {
        let numberFormatter = initNumberFormatter()
        
        guard let doubleNumber = Double(number) else {
            return number
        }
        
        guard let formattedResult = numberFormatter.string(for: doubleNumber) else {
            return number
        }
        
        return formattedResult
    }
    
    private func initNumberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        
        return numberFormatter
    }
    
    private func removeAllFormulaHistory() {
        formulaHistoryStackView.arrangedSubviews.forEach({ (view: UIView) -> Void in
            view.removeFromSuperview()
        })
    }
    
    private func updateCurrentInputLabel() {
        currentInputOperandLabel.text = formatNumberForCurrentLabel(calculatorModel.currentInputOperand)
        currentInputOperatorLabel.text = calculatorModel.currentInputOperator
    }
    
}

fileprivate extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + contentInset.bottom)
        setContentOffset(bottomOffset, animated: false)
    }
}
