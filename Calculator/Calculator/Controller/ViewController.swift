//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    private var isCalculated: Bool = false
    private var expression: String = ""
    private var currentOperand: String = "0"
    private let numberFormatter: NumberFormatter = NumberFormatter()
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionQueue: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperand()
        operatorLabel.text = ""
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
        expressionScrollView.showsVerticalScrollIndicator = false
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle, operandLabel.text?.count ?? 0 <= 18 else { return }
        if isCalculated { clearOperand() }
        
        switch tappedOperand {
        case ".":
            handleDotButton()
        case "0", "00":
            handleZeroButtons(from: tappedOperand)
        default:
            appendOperands(from: tappedOperand)
        }
        
        displayOperand()
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let tappedOperator = sender.currentTitle, Double(currentOperand) != .zero else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        appendExpressionQueue()
        
        clearOperand()
        operatorLabel.text = tappedOperator
        updateScroll()
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
        guard !expression.isEmpty else { return }
        appendExpressionQueue()
        updateScroll()
        
        var components = ExpressionParser.parse(from: expression)
        let result = components.result()
        
        if result.isNaN {
            operandLabel.text = "NaN"
        } else {
            operandLabel.text = "\(addComma(number: String(result)))"
        }
        
        operatorLabel.text = ""
        isCalculated = true
        currentOperand = "\(result)"
        expression = ""
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        handleSignButton()
        isCalculated = false
        operandLabel.text = currentOperand
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

// handling number
extension ViewController {
    private func addComma(number: String) -> String {
        guard let result = numberFormatter.string(for: Double(number)) else { return number }
        return result
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
        guard currentOperand != "0" else { return }
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
        isCalculated = false
        currentOperand = "0"
        operandLabel.text = "0"
    }
    
    private func displayOperand() {
        let integerPart: String = currentOperand.components(separatedBy: ".")[0]
        
        if currentOperand.last == "." {
            operandLabel.text = addComma(number: integerPart) + "."
        } else if currentOperand.contains("."), currentOperand.last != "." {
            let decimalPart: String = currentOperand.components(separatedBy: ".")[1]
            operandLabel.text = addComma(number: integerPart) + "." + decimalPart
        } else {
            operandLabel.text = addComma(number: currentOperand)
        }
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
        let operandLabel: UILabel = makeExpressionLabel(addComma(number: currentOperand))
        stackView.addArrangedSubview(operandLabel)
        expression.append(" \(currentOperand)")
        
        expressionQueue.addArrangedSubview(stackView)
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
