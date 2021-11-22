//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    private var calculatorModel = Calculator() {
        didSet {
            updateCurrentInputLabel()
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
        guard let number = sender.titleLabel?.text else { return }
        calculatorModel.touchNumberButton(number)
    }
    
    @IBAction private func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else { return }
        calculatorModel.touchOperatorButton(operatorSymbole)
    }
    
    @IBAction private func touchSignChangeButton(_ sender: UIButton) {
        calculatorModel.touchSignChangeButton()
    }
    
    @IBAction private func touchAllClearButton(_ sender: UIButton) {
        calculatorModel.touchAllClearButton()
        removeAllFormulaHistory()
    }
    
    @IBAction private func touchClearEntryButton(_ sender: UIButton) {
        calculatorModel.touchClearEntryButton()
        removeAllFormulaHistory()
    }
    
    @IBAction private func touchEvaluateButton(_ sender: UIButton) {
        calculatorModel.touchEvaluateButton()
    }
    
    private func addCurrentInputToFormulaHistory() {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        
        let operatorSignLabelView = UILabel()
        operatorSignLabelView.text = calculatorModel.currentInputOperator
        operatorSignLabelView.textColor = .white
        
        let operandLabelView = UILabel()
        
        operandLabelView.text = calculatorModel.currentInputOperand
        operandLabelView.textColor = .white
        
        stackView.addArrangedSubview(operatorSignLabelView)
        stackView.addArrangedSubview(operandLabelView)
        
        formulaHistoryStackView.addArrangedSubview(stackView)
    }
    
    private func removeAllFormulaHistory() {
        formulaHistoryStackView.arrangedSubviews.forEach({ (view: UIView) -> Void in
            view.removeFromSuperview()
        })
    }
    
    private func updateCurrentInputLabel() {
        currentInputOperandLabel.text = calculatorModel.currentInputOperand
        currentInputOperatorLabel.text = calculatorModel.currentInputOperator
    }
}

fileprivate extension UIScrollView {
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height)
        setContentOffset(bottomOffset, animated: false)
    }
}
