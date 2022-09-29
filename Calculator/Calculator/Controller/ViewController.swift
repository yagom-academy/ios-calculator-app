//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    private var expression: String = ""
    private var currentOperand: String = "0"
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionQueue: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperand()
        operatorLabel.text = ""
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle else { return }
        
        switch tappedOperand {
        case "⁺⁄₋":
            handleSignButton()
        case ".":
            handleDotButton()
        case "0", "00":
            handleZeroButtons(from: tappedOperand)
        default:
            appendOperands(from: tappedOperand)
        }
        operandLabel.text = currentOperand
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let tappedOperator = sender.currentTitle, Double(currentOperand) != .zero else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        appendExpressionQueue()
        
        clearOperand()
        operatorLabel.text = tappedOperator
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
        guard !expression.isEmpty else { return }
        appendExpressionQueue()
        
        var components = ExpressionParser.parse(from: expression)
        let result = components.result()
        
        if result.isNaN {
            operandLabel.text = "NaN"
        } else {
            operandLabel.text = String(result)
        }
        
        operatorLabel.text = ""
        currentOperand = "0"
        expression = ""
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        clearOperand()
    }

    @IBAction func tapACButton(_ sender: UIButton) {
        expressionQueue.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        clearOperand()
        operatorLabel.text = ""
    }
}

// handling Operands
extension ViewController {
    private func handleSignButton() {
        guard currentOperand != "0" else { return }
        
        if currentOperand.first == "-" {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-" + currentOperand
        }
    }
    
    private func handleDotButton() {
        guard !currentOperand.contains(".") else { return }
        currentOperand.append(".")
    }
    
    private func handleZeroButtons(from operand: String) {
        guard Double(currentOperand) != .zero else { return }
        currentOperand.append(operand)
    }
    
    private func appendOperands(from operand: String) {
        if currentOperand == "0" {
            currentOperand = operand
        } else {
            currentOperand.append(operand)
        }
    }
    
    private func clearOperand() {
        currentOperand = "0"
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
            expression.append(" \(currentOperator)")
        }
        let operandLabel: UILabel = makeExpressionLabel(currentOperand)
        stackView.addArrangedSubview(operandLabel)
        expression.append(" \(currentOperand)")
        
        expressionQueue.addArrangedSubview(stackView)
    }
}
