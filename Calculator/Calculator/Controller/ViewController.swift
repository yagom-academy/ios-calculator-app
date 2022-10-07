//
//  ViewController.swift
//  Created by Wonbi, Ash
//

import UIKit

class ViewController: UIViewController {
    private var isCalculated: Bool = false
    private var operandManager: OperandManager = OperandManager()
    private let componentMaker: ComponentMaker = ComponentMaker()
    
    @IBOutlet private weak var mainOperandLabel: UILabel!
    @IBOutlet private weak var mainOperatorLabel: UILabel!
    @IBOutlet private weak var expressionQueue: UIStackView!
    @IBOutlet private weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetMainOperand(to: ExpressionText.zero)
        mainOperatorLabel.text = ExpressionText.empty
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
        expressionScrollView.showsVerticalScrollIndicator = false
    }
    
    @IBAction private func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle, mainOperandLabel.text?.count ?? 0 <= 18 else { return }
        if isCalculated { resetMainOperand(to: ExpressionText.zero) }
        
        switch tappedOperand {
        case ExpressionText.dot:
            operandManager.handleDotButton()
        case ExpressionText.zero, ExpressionText.doubleZero:
            operandManager.handleZeroButtons(from: tappedOperand)
        default:
            operandManager.appendOperands(from: tappedOperand)
        }
        
        mainOperandLabel.text = operandManager.currentOperand.addCommaInteger()
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard !operandManager.expression.isEmpty || mainOperandLabel.text != ExpressionText.zero else { return }
        
        if mainOperandLabel.text != ExpressionText.zero {
            appendExpressionQueue()
            resetMainOperand(to: ExpressionText.zero)
        }
        mainOperatorLabel.text = sender.currentTitle
    }
    
    @IBAction private func tapEqualsButton(_ sender: UIButton) {
        guard !operandManager.expression.isEmpty else { return }
        appendExpressionQueue()
        
        var components = ExpressionParser.parse(from: operandManager.expression)
        let result = components.result()
        
        if result.isNaN {
            mainOperandLabel.text = ExpressionText.nan
        } else {
            mainOperandLabel.text = String(result).addComma()
        }
        
        isCalculated = true
        mainOperatorLabel.text = ExpressionText.empty
        result.description.hasSuffix(".0") ?
        operandManager.setCurrentOperand("\(Int(result))") :
        operandManager.setCurrentOperand("\(result)")
        operandManager.clearExpression()
    }
    
    @IBAction private func tapSignButton(_ sender: UIButton) {
        guard mainOperandLabel.text != ExpressionText.zero else { return }

        isCalculated = false
        operandManager.handleSignButton()
        mainOperandLabel.text = operandManager.currentOperand.addCommaInteger()
    }
    
    @IBAction private func tapClearButton(_ sender: UIButton) {
        if sender.currentTitle == "AC" {
            resetScrollView()
            operandManager.clearExpression()
            mainOperatorLabel.text = ExpressionText.empty
        }
        resetMainOperand(to: ExpressionText.zero)
    }
}

// MARK: handling view
extension ViewController {
    private func resetMainOperand(to operand: String) {
        isCalculated = false
        mainOperandLabel.text = ExpressionText.zero
        operandManager.setCurrentOperand(operand)
    }
    
    private func updateExpression(to stackView: UIStackView, text: String) {
        let label: UILabel = componentMaker.makeLabel(text.addComma())
        stackView.addArrangedSubview(label)
        operandManager.appendToExpression(" \(text)")
    }

    private func appendExpressionQueue() {
        guard let currentOperator = mainOperatorLabel.text else { return }
        let stackView: UIStackView = componentMaker.makeStackView()
        
        if !operandManager.expression.isEmpty {
            updateExpression(to: stackView, text: currentOperator)
        }
        updateExpression(to: stackView, text: operandManager.currentOperand)
        
        expressionQueue.addArrangedSubview(stackView)
        updateScroll()
    }
    
    private func updateScroll() {
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.setContentOffset(CGPoint(x: 0,
                                                      y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
                                              animated: false)
    }
    
    private func resetScrollView() {
        expressionQueue.subviews.forEach { $0.removeFromSuperview() }
    }
}
