//  Calculator - ViewController.swift
//  Created by 레옹아범.


import UIKit

class ViewController: UIViewController {
    
    private let numberFormatter = NumberFormatter()
    private var inputs: String = ""
    private var currentOperand: String = ""
    private var currentOperator: String = ""
    private var isFractional: Bool = false
    private var isCalculated: Bool = false
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackViewInScrollView: UIStackView!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNumberFormatter()
        self.currentOperatorLabel.text = ""
    }
    
    @IBAction private func didTapButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        if self.isCalculated {
            clearAll()
            self.isCalculated.toggle()
        }
        
        switch buttonTitle {
        case "=":
            calculate()
        case "AC":
            clearAll()
        case "CE":
            clearCurrentOperand()
        case "⁺⁄₋":
            reverseOperand()
        case "÷", "×", "−", "+":
            clickedOperator(operatorValue: buttonTitle)
        case "0", "00":
            addZeroToOperandLabel(operand: buttonTitle)
        case ".":
            addDotToOperandLabel()
        default:
            addNumberToOperandLabel(operand: buttonTitle)
        }
    }
    
    func setNumberFormatter() {
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.roundingMode = .ceiling
        self.numberFormatter.usesSignificantDigits = true
        self.numberFormatter.minimumSignificantDigits = 0
        self.numberFormatter.maximumSignificantDigits = 20
    }
    
    func calculate() {
        addStackView(number: self.currentOperand, operatorType: self.currentOperator)
        self.inputs += "\(self.currentOperator) \(self.currentOperand) "
        
        var formula = ExpressionParser.parse(from: inputs)
        let result = formula.result()
        
        guard let resultValue = self.numberFormatter.string(from: NSNumber(floatLiteral: result)) else { return }
        
        self.inputs = ""
        self.currentOperator = ""
        self.currentOperatorLabel.text = self.currentOperator
        self.currentOperandLabel.text = resultValue
        self.isFractional = false
        self.isCalculated = true
    }
    
    func clearAll() {
        self.removeAllStackView()
        self.inputs = ""
        self.currentOperand = ""
        self.currentOperator = ""
        
        self.currentOperandLabel.text = "0"
        self.currentOperatorLabel.text = self.currentOperator
        self.isFractional = false
    }
    
    func clearCurrentOperand() {
        self.currentOperand = ""
        self.currentOperandLabel.text = "0"
        self.isFractional = false
    }
    
    func reverseOperand() {
        guard let firstValue = self.currentOperand.first else { return }
        if firstValue.isNumber {
            self.currentOperand = "-" + self.currentOperand
            self.currentOperandLabel.text = self.currentOperand
        } else if firstValue == "-" {
            self.currentOperand.removeFirst()
            self.currentOperandLabel.text = self.currentOperand
        }
    }
    
    func clickedOperator(operatorValue: String) {
        if currentOperand != "" {
            let currentOperandValue = self.currentOperand
            let currentOperatorValue = self.currentOperator
            
            addStackView(number: currentOperandValue, operatorType: currentOperatorValue)
            
            self.inputs += "\(currentOperatorValue) \(currentOperandValue) "
            
            self.currentOperand = ""
            self.currentOperandLabel.text = "0"
            self.currentOperator = operatorValue
            self.currentOperatorLabel.text = self.currentOperator
        } else {
            self.currentOperator = operatorValue
            self.currentOperatorLabel.text = self.currentOperator
        }
        
        self.isFractional = false
    }
    
    func addZeroToOperandLabel(operand: String) {
        self.currentOperand += operand
        
        guard let number = Double(self.currentOperand),
              let formattedOperand = self.numberFormatter.string(from: NSNumber(floatLiteral: number))  else { return }
        
        self.currentOperand = formattedOperand
        self.currentOperandLabel.text = self.currentOperand
    }
    
    func addDotToOperandLabel() {
        if self.currentOperand == "" {
            self.currentOperand = "0."
        } else {
            self.currentOperand += "."
        }
        
        self.currentOperandLabel.text = self.currentOperand
        self.isFractional = true
    }
    
    func addNumberToOperandLabel(operand: String) {
        self.currentOperand += operand
        
        guard let number = self.numberFormatter.number(from: self.currentOperand),
              let formattedOperand = self.numberFormatter.string(from: number)  else { return }
        
        self.currentOperand = "\(number)"
        self.currentOperandLabel.text = formattedOperand
    }
}

extension ViewController {
    func addStackView(number: String?, operatorType: String?) {
        guard let operandValue = number,
              let operatorValue = operatorType else { return }

        let enteredStackView = UIStackView()
        enteredStackView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        enteredStackView.axis = .horizontal
        enteredStackView.translatesAutoresizingMaskIntoConstraints = false
        enteredStackView.alignment = .fill
        enteredStackView.distribution = .fill
        enteredStackView.spacing = 8

        let operatorLabel = UILabel()
        operatorLabel.font = .preferredFont(forTextStyle: .title3)
        operatorLabel.text = operatorValue

        let operandLabel = UILabel()
        operandLabel.font = .preferredFont(forTextStyle: .title3)
        operandLabel.text = operandValue

        enteredStackView.addArrangedSubview(operatorLabel)
        enteredStackView.addArrangedSubview(operandLabel)

        operandLabel.trailingAnchor.constraint(equalTo: enteredStackView.trailingAnchor, constant: 0).isActive = true
        operandLabel.topAnchor.constraint(equalTo: enteredStackView.topAnchor, constant: 0).isActive = true
        operandLabel.bottomAnchor.constraint(equalTo: enteredStackView.bottomAnchor, constant: 0).isActive = true

        operatorLabel.leadingAnchor.constraint(equalTo: enteredStackView.leadingAnchor, constant: 0).isActive = true
        operatorLabel.topAnchor.constraint(equalTo: enteredStackView.topAnchor, constant: 0).isActive = true
        operatorLabel.bottomAnchor.constraint(equalTo: enteredStackView.bottomAnchor, constant: 0).isActive = true

        self.stackViewInScrollView.addArrangedSubview(enteredStackView)
        
        scrollToBottom()
    }

    func removeAllStackView() {
        let allSubViewsInStackVIew = self.stackViewInScrollView.arrangedSubviews
        for stackView in allSubViewsInStackVIew {
            stackView.removeFromSuperview()
        }
    }

    func scrollToBottom() {
        if self.scrollView.contentSize.height < self.scrollView.bounds.size.height { return }
        self.scrollView.layoutIfNeeded()
        self.stackViewInScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        self.scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
