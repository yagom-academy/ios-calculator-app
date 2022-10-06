//
//  ViewController.swift
//  Created by Wonbi
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
        clearOperandLabel()
        mainOperatorLabel.text = ""
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
        expressionScrollView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle, mainOperandLabel.text?.count ?? 0 <= 18 else { return }
        if isCalculated { clearOperandLabel() }
        
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
        
        if mainOperandLabel.text != "0" {
            updateExpression()
            appendExpressionQueue()
            resetMainOperand()
        }
        mainOperatorLabel.text = sender.currentTitle
    }
    
    private func updateExpression() {
            let operatorValue: String = mainOperatorLabel.text ?? ""

            operandManager.appendToExpression(" \(operatorValue) \(operandManager.currentOperand)")
        }
    
    private func resetMainOperand() {
        mainOperandLabel.text = "0"
        operandManager.setCurrentOperand("0")
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
        
        mainOperatorLabel.text = ""
        isCalculated = true
        operandManager.setCurrentOperand("\(result)")
        operandManager.clearExpression()
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        guard let operandLabelText = mainOperandLabel.text,
              operandLabelText != "0" else { return }
        
        operandLabelText.contains("-") ?
        (mainOperandLabel.text = operandLabelText.split(with: "-").joined()) :
        (mainOperandLabel.text = "-" + operandLabelText)
        
        isCalculated = false
        operandManager.handleSignButton()
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        clearOperandLabel()
    }

    @IBAction func tapACButton(_ sender: UIButton) {
        deleteStackViewInScrollView()
        clearOperandLabel()
        operandManager.clearExpression()
        mainOperatorLabel.text = ""
    }
    
    func deleteStackViewInScrollView() {
        expressionScrollView.subviews.forEach {
            $0.isHidden = true
        }
    }
}

// handling view
extension ViewController {
    private func clearOperandLabel() {
        isCalculated = false
        operandManager.setCurrentOperand("0")
        mainOperandLabel.text = "0"
    }

    private func appendExpressionQueue() {
        guard let currentOperator = mainOperatorLabel.text else { return }
        let stackView: UIStackView = componentMaker.makeStackView()
        
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
