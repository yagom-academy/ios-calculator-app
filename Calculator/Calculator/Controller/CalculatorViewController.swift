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
    
    @IBAction private func touchPointNumber(_ sender: UIButton) {
        calculatorModel.touchPointButton()
    }
    
    @IBAction private func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else {
            return
        }
        calculatorModel.touchOperatorButton(operatorSymbole)
    }
    
    @IBAction private func touchSignChangeButton(_ sender: UIButton) {
        calculatorModel.touchSignChangeButton()
    }
    
    @IBAction private func touchAllClearButton(_ sender: UIButton) {
        calculatorModel.touchAllClearButton()
    }
    
    @IBAction private func touchClearEntryButton(_ sender: UIButton) {
        calculatorModel.touchClearEntryButton()
    }
    
    @IBAction private func touchEvaluateButton(_ sender: UIButton) {
        calculatorModel.touchEvaluateButton()
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
        
        guard let numberPointIndex = number.firstIndex(of: LabelContents.pointSymbole) else {
            return result
        }
        
        guard let resultPointIndex = result.firstIndex(of: LabelContents.pointSymbole) else {
            return result + String(number[numberPointIndex...])
        }
        
        return String(result[..<resultPointIndex]) + String(number[numberPointIndex...])
    }
    
    private func formatNumberForStackView(_ number: String) -> String {
        let numberFormatter = initNumberFormatter()
        
        guard let formattedResult = numberFormatter.string(for: Double(number)) else {
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
    
    private struct LabelContents {
        static let zero: Character = "0"
        static let pointSymbole: Character = "."
    }
}

fileprivate extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + contentInset.bottom)
        setContentOffset(bottomOffset, animated: false)
    }
}
