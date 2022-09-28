//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
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
        guard Double(currentOperand) != .zero else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        let operand: UILabel = makeExpressionLabel(currentOperand)
        let `operator`: UILabel = makeExpressionLabel(operatorLabel.text)
        let stackView: UIStackView = makeExpressionStackView()

        
        stackView.addArrangedSubview(`operator`)
        stackView.addArrangedSubview(operand)
        expressionQueue.addArrangedSubview(stackView)
        
        clearOperand()
        operatorLabel.text = sender.currentTitle
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
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
        if currentOperand.first == "-" {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-" + currentOperand
        }
    }
    
    private func handleDotButton() {
        if currentOperand.contains(".") { return }
        currentOperand.append(".")
    }
    
    private func handleZeroButtons(from operand: String) {
        if Double(currentOperand) == .zero { return }
        currentOperand.append(operand)
    }
    
    private func appendOperands(from operand: String) {
        if currentOperand == "0" {
            currentOperand = operand
        } else if currentOperand == "-0" {
            currentOperand = "-" + operand
        } else {
            currentOperand.append(operand)
        }
    }
    
    private func clearOperand() {
        currentOperand = "0"
        operandLabel.text = "0"
    }
}

// making stackView
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
}
