//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    private var isCalculated: Bool = false
    private var operandHandler: OperandHandler = OperandHandler()
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
            operandHandler.handleDotButton()
        case "0", "00":
            operandHandler.handleZeroButtons(from: tappedOperand)
        default:
            operandHandler.appendOperands(from: tappedOperand)
        }
        
        operandHandler.displayOperand(to: operandLabel)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let tappedOperator = sender.currentTitle, Double(operandHandler.currentOperand) != .zero else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        appendExpressionQueue()
        
        clearOperandLabel()
        operatorLabel.text = tappedOperator
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
        guard !operandHandler.expression.isEmpty else { return }
        appendExpressionQueue()
        
        var components = ExpressionParser.parse(from: operandHandler.expression)
        let result = components.result()
        
        if result.isNaN {
            operandLabel.text = "NaN"
        } else {
            operandLabel.text = String(result).addComma()
        }
        
        operatorLabel.text = ""
        isCalculated = true
        operandHandler.setCurrentOperand("\(result)")
        operandHandler.clearExpression()
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        operandHandler.handleSignButton()
        isCalculated = false
        operandLabel.text = operandHandler.currentOperand.addComma()
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        clearOperandLabel()
    }

    @IBAction func tapACButton(_ sender: UIButton) {
        expressionQueue.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        clearOperandLabel()
        operandHandler.clearExpression()
        operatorLabel.text = ""
    }
}

// handling OperandsLabel
extension ViewController {
    private func clearOperandLabel() {
        isCalculated = false
        operandHandler.setCurrentOperand("0")
        operandLabel.text = "0"
    }
}

// handling stackView
extension ViewController {
    private func makeExpressionLabel(_ expr: String?) -> UILabel {
        let label: UILabel = UILabel()
        
        label.text = expr
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeExpressionStackView() -> UIStackView {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    private func appendExpressionQueue() {
        let stackView: UIStackView = makeExpressionStackView()
        
        guard let currentOperator = operatorLabel.text else { return }
        if !expressionQueue.arrangedSubviews.isEmpty {
            let operatorLabel: UILabel = makeExpressionLabel(currentOperator)
            stackView.addArrangedSubview(operatorLabel)
            operandHandler.appendToExpression(" \(currentOperator)")
        }
        let operandLabel: UILabel = makeExpressionLabel(operandHandler.currentOperand.addComma())
        stackView.addArrangedSubview(operandLabel)
        operandHandler.appendToExpression(" \(operandHandler.currentOperand)")
        
        expressionQueue.addArrangedSubview(stackView)
        updateScroll()
    }
}

// handling scrollView
extension ViewController {
    func updateScroll() {
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.setContentOffset(CGPoint(x: 0,
                                                      y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
                                              animated: false)
    }
}
