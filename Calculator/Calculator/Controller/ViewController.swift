//
//  ViewController.swift
//  Created by Wonbi, Ash
//

import UIKit

class ViewController: UIViewController {
    private var isCalculated: Bool = false
    private var operandManager: OperandManager = OperandManager()
    private let componentMaker: ComponentMaker = ComponentMaker()
    
    @IBOutlet weak var mainOperandLabel: UILabel!
    @IBOutlet weak var mainOperatorLabel: UILabel!
    @IBOutlet weak var expressionQueue: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetMainOperand(to: "0")
        mainOperatorLabel.text = ""
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
        expressionScrollView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle, mainOperandLabel.text?.count ?? 0 <= 18 else { return }
        if isCalculated { resetMainOperand(to: "0") }
        
        switch tappedOperand {
        case ".":
            operandManager.handleDotButton()
        case "0", "00":
            operandManager.handleZeroButtons(from: tappedOperand)
        default:
            operandManager.appendOperands(from: tappedOperand)
        }
        
        mainOperandLabel.text = operandManager.currentOperand.addCommaInteger()
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard !operandManager.expression.isEmpty || mainOperandLabel.text != "0" else { return }
        
        mainOperatorLabel.text = sender.currentTitle
        if mainOperandLabel.text != "0" {
            appendExpressionQueue()
            resetMainOperand(to: "0")
        }
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
        guard !operandManager.expression.isEmpty else { return }
        appendExpressionQueue()
        
        var components = ExpressionParser.parse(from: operandManager.expression)
        let result = components.result()
        
        if result.isNaN {
            mainOperandLabel.text = "NaN"
        } else {
            mainOperandLabel.text = String(result).addComma()
        }
        
        isCalculated = true
        mainOperatorLabel.text = ""
        operandManager.setCurrentOperand("\(result)")
        operandManager.clearExpression()
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        guard mainOperandLabel.text != "0" else { return }

        isCalculated = false
        operandManager.handleSignButton()
        mainOperandLabel.text = operandManager.currentOperand.addCommaInteger()
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        if sender.currentTitle == "AC" {
            resetScrollView()
            operandManager.clearExpression()
            mainOperatorLabel.text = ""
        }
        resetMainOperand(to: "0")
    }
}

// MARK: handling view
extension ViewController {
    private func resetMainOperand(to operand: String) {
        isCalculated = false
        mainOperandLabel.text = "0"
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
        
        if !expressionQueue.arrangedSubviews.isEmpty {
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
