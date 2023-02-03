//  Calculator - ViewController.swift
//  Created by 레옹아범.


import UIKit

final class CalculatorViewController: UIViewController {
    
    private var inputs: String = CalculatorInitial.initValue
    private var currentOperand: String = CalculatorInitial.initValue
    private var currentOperator: String = CalculatorInitial.initValue
    private var isCalculated: Bool = false
    private var isFractional: Bool {
        self.currentOperand.contains(".")
    }
    private var isFirstInput: Bool {
        return self.formulaStackView.subviews.isEmpty
    }
    
    @IBOutlet private weak var formulaScrollView: UIScrollView!
    @IBOutlet private weak var formulaStackView: UIStackView!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentOperatorLabel.text = CalculatorInitial.initValue
        self.currentOperandLabel.text = CalculatorInitial.initLabel
    }
    
    @IBAction private func didTapNumberButton(sender: UIButton) {
        guard let numberButtonTitle = sender.currentTitle else { return }
        
        addNumberToOperandLabel(numberButtonTitle)
    }
    
    @IBAction private func didTapZeroButton(sender: UIButton) {
        guard let zeroButtonTitle = sender.currentTitle else { return }
        
        addZeroToOperandLabel(zeroButtonTitle)
    }
    
    @IBAction private func didTapDotButton(sender: UIButton) {
        addDotToOperandLabel()
    }
    
    @IBAction private func didTapOperatorButton(sender: UIButton) {
        guard let operatorButtonTitle = sender.currentTitle else { return }
        
        touchUpOperator(operatorButtonTitle)
    }
    
    @IBAction private func didTapReverseOperandButton(sender: UIButton) {
        reverseOperand()
    }
    
    @IBAction private func didTapClearButton(sender: UIButton) {
        clearCurrentOperand()
    }
    
    @IBAction private func didTapAllClearButton(sender: UIButton) {
        clearAll()
    }
    
    @IBAction private func didTapCalculateButton(sender: UIButton) {
        calculate()
    }
    
    private func calculate() {
        if self.isCalculated == false && self.currentOperand.isEmpty == false {
            addStackView(number: self.currentOperandLabel.text, operatorType: self.currentOperator)
            
            self.inputs += "\(self.currentOperator) \(self.currentOperand) "
            
            var formula = ExpressionParser.parse(from: inputs)
            let result = formula.result()
            
            if result.isNaN {
                resetPropertity()
                resetLabel()
                self.currentOperandLabel.text = "NaN"
                self.isCalculated = false
                self.isCalculated = true
                
                return
            }
            
            let formattedOperand = formattingNumber("\(result)")
            
            resetPropertity()
            resetLabel()
            self.currentOperand = "\(formattedOperand)"
            self.currentOperandLabel.text = formattedOperand
            self.isCalculated = true
        }
    }
    
    private func clearAll() {
        resetPropertity()
        resetLabel()
        self.removeAllStackView()
    }
    
    private func clearCurrentOperand() {
        self.currentOperand = ""
        self.currentOperandLabel.text = "0"
    }
    
    private func reverseOperand() {
        guard let firstValue = self.currentOperand.first else { return }
        
        if firstValue.isNumber {
            self.currentOperand = "-" + self.currentOperand
        } else if firstValue == "-" {
            self.currentOperand.removeFirst()
        }
        
        updateCurrentNumberLabel(self.currentOperand)
    }
    
    private func touchUpOperator(_ operatorValue: String) {
        if self.currentOperandLabel.text != CalculatorInitial.initLabel {
            let currentOperandValue = formattingNumber(self.currentOperand)
            let currentOperatorValue = self.currentOperator
            
            addStackView(number: currentOperandValue, operatorType: currentOperatorValue)
            
            self.inputs += "\(self.currentOperator) \(self.currentOperand) "
            
            resetOperand()
            
            self.currentOperator = operatorValue
            self.currentOperatorLabel.text = self.currentOperator
        } else if isFirstInput == false {
            self.currentOperator = operatorValue
            self.currentOperatorLabel.text = self.currentOperator
        }
        
        self.isCalculated = false
    }
    
    private func addZeroToOperandLabel(_ operand: String) {
        if self.isFractional == false {
            self.currentOperand += operand
            updateCurrentNumberLabel(self.currentOperand)
        } else {
            self.currentOperand += operand
            self.currentOperandLabel.text = self.currentOperand
        }
    }
    
    private func addDotToOperandLabel() {
        guard self.currentOperand.contains(".") == false else { return }
        
        if self.currentOperand == CalculatorInitial.initValue {
            self.currentOperand = "0."
        } else {
            self.currentOperand += "."
        }
        
        self.currentOperandLabel.text = self.currentOperand
    }
    
    private func addNumberToOperandLabel(_ operand: String) {
        self.currentOperand += operand
        
        updateCurrentNumberLabel(self.currentOperand)
    }
    
    private func updateCurrentNumberLabel(_ value: String) {
        let formattedOperand = formattingNumber(value)
        
        self.currentOperandLabel.text = formattedOperand
    }
    
    private func formattingNumber(_ value: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesSignificantDigits = true
        formatter.minimumSignificantDigits = 1
        
        guard let formattedNumber = formatter.number(from: value),
              let formattedOperand = formatter.string(from: formattedNumber) else { return "0" }
        
        return formattedOperand
    }
    
    private func resetOperand() {
        self.currentOperand.removeAll()
        self.currentOperandLabel.text = CalculatorInitial.initLabel
    }
    
    private func resetOperator() {
        self.currentOperator.removeAll()
        self.currentOperatorLabel.text?.removeAll()
    }
    
    private func resetPropertity() {
        self.inputs.removeAll()
        self.currentOperand.removeAll()
        self.currentOperator.removeAll()
    }
    
    private func resetLabel() {
        self.currentOperandLabel.text = CalculatorInitial.initLabel
        self.currentOperatorLabel.text?.removeAll()
    }
}

extension CalculatorViewController {
    private func addStackView(number: String?, operatorType: String?) {
        guard let operandValue = number,
              let operatorValue = operatorType else { return }
        
        let formulaLabel = UILabel()
        formulaLabel.font = .preferredFont(forTextStyle: .title3)
        formulaLabel.text = "\(operatorValue) \(operandValue)"
        formulaLabel.textColor = .white

        self.formulaStackView.addArrangedSubview(formulaLabel)
        
        scrollToBottom()
    }

    private func removeAllStackView() {
        let allSubViewsInStackVIew = self.formulaStackView.arrangedSubviews
        
        allSubViewsInStackVIew.forEach { label in
            self.formulaStackView.removeArrangedSubview(label)
            label.removeFromSuperview()
        }
    }

    private func scrollToBottom() {
        if self.formulaScrollView.contentSize.height < self.formulaScrollView.bounds.size.height { return }
        self.formulaScrollView.layoutIfNeeded()
        self.formulaStackView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.formulaScrollView.contentSize.height - self.formulaScrollView.bounds.size.height)
        self.formulaScrollView.setContentOffset(bottomOffset, animated: true)
    }
}
