//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorModel = Calculator()
    
    @IBOutlet weak var formulaHistoryScrollView: UIScrollView!
    @IBOutlet weak var formulaHistoryStackView: UIStackView!
    @IBOutlet weak var currentInputOperandLabel: UILabel!
    @IBOutlet weak var currentInputOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentInputLabel()
        removeAllFormulaHistory()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        calculatorModel.touchNumberButton(number)
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else { return }
        calculatorModel.touchOperatorButton(operatorSymbole)
    }
    
    @IBAction func touchSignChangeButton(_ sender: UIButton) {
        calculatorModel.touchSignChangeButton()
    }
    
    @IBAction func touchAllClearButton(_ sender: UIButton) {
        calculatorModel.touchAllClearButton()
        removeAllFormulaHistory()
    }
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
        calculatorModel.touchClearEntryButton()
        removeAllFormulaHistory()
    }
    
    @IBAction func touchEvaluateButton(_ sender: UIButton) {
        calculatorModel.touchEvaluateButton()
    }
    
    func addCurrentInputToFormulaHistory() {
        let formatter = initNumberFormatterForCalculator()
        
        let stackView = UIStackView()
        stackView.spacing = 8.0
        
        let operatorSignLabelView = UILabel()
        operatorSignLabelView.text = currentInputOperator
        operatorSignLabelView.textColor = .white
        
        let operandLabelView = UILabel()
        
        operandLabelView.text = formatter.string(for: Double(currentInputOperand)) ?? currentInputOperand
        operandLabelView.textColor = .white
        
        stackView.addArrangedSubview(operatorSignLabelView)
        stackView.addArrangedSubview(operandLabelView)
        
        formulaHistoryStackView.addArrangedSubview(stackView)
    }
    
    func removeAllFormulaHistory() {
        formulaHistoryStackView.arrangedSubviews.forEach({ (view: UIView) -> Void in
            view.removeFromSuperview()
        })
    }
    
    func updateCurrentInputLabel() {
        currentInputOperandLabel.text = calculatorModel.currentInputOperand
        currentInputOperatorLabel.text = calculatorModel.currentInputOperator
    }
    
    struct LabelContents {
        static let notANumber = "NaN"
        static let emptyString = ""
        static let defaultOperand = "0"
        static let minusSignSymbole = "-"
        static let pointSymbole = "."
        static let doubleZero = "00"
        static let error = "error"
    }
}

extension UIScrollView {
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height)
        setContentOffset(bottomOffset, animated: false)
    }
}
