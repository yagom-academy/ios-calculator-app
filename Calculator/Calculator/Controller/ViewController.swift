//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    private var isCalculated: Bool = false
    private var operandManager: OperandManager = OperandManager()
    private let componentMaker: ComponentMaker = ComponentMaker()
    private let numberFormatter: NumberFormatter = NumberFormatter()
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionQueue: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperandLabel()
        operatorLabel.text = ""
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
        expressionScrollView.showsVerticalScrollIndicator = false
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle, operandLabel.text?.count ?? 0 <= 18 else { return }
        if isCalculated { clearOperandLabel() }
        
        switch tappedOperand {
        case ".":
            operandManager.handleDotButton()
        case "0", "00":
            operandManager.handleZeroButtons(from: tappedOperand)
        default:
            operandManager.appendOperands(from: tappedOperand)
        }
        
        operandManager.displayOperand(to: operandLabel)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let tappedOperator = sender.currentTitle, Double(operandManager.currentOperand) != .zero else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        appendExpressionQueue()
        
        clearOperandLabel()
        operatorLabel.text = tappedOperator
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
        guard !operandManager.expression.isEmpty else { return }
        appendExpressionQueue()
        
        var components = ExpressionParser.parse(from: operandManager.expression)
        let result = components.result()
        
        if result.isNaN {
            operandLabel.text = "NaN"
        } else {
            operandLabel.text = String(result).addComma()
        }
        
        operatorLabel.text = ""
        isCalculated = true
        operandManager.setCurrentOperand("\(result)")
        operandManager.clearExpression()
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        operandManager.handleSignButton()
        isCalculated = false
        operandLabel.text = operandManager.currentOperand.addComma()
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        clearOperandLabel()
    }

    @IBAction func tapACButton(_ sender: UIButton) {
        expressionQueue.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        clearOperandLabel()
        operandManager.clearExpression()
        operatorLabel.text = ""
    }
}

// handling view
extension ViewController {
    private func clearOperandLabel() {
        isCalculated = false
        operandManager.setCurrentOperand("0")
        operandLabel.text = "0"
    }

    private func appendExpressionQueue() {
        let stackView: UIStackView = componentMaker.makeStackView()
        
        guard let currentOperator = operatorLabel.text else { return }
        if !expressionQueue.arrangedSubviews.isEmpty {
            let operatorLabel: UILabel = componentMaker.makeLabel(currentOperator)
            stackView.addArrangedSubview(operatorLabel)
            operandManager.appendToExpression(" \(currentOperator)")
        }
        let operandLabel: UILabel = componentMaker.makeLabel(operandManager.currentOperand.addComma())
        stackView.addArrangedSubview(operandLabel)
        operandManager.appendToExpression(" \(operandManager.currentOperand)")
        
        expressionQueue.addArrangedSubview(stackView)
        updateScroll()
    }
    
    func updateScroll() {
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.setContentOffset(CGPoint(x: 0,
                                                      y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
                                              animated: false)
    }
}
