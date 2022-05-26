//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var isOperandInputed = false
    private var isCalculateCompleted = false
    private var inputedFomula = "0"
    
    @IBOutlet private weak var fomulaScrollView: UIScrollView!
    @IBOutlet private weak var fomulaStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fomulaStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func setToDefault(_ sender: UIButton) {
        resetCalculateOption()
    }
    
    @IBAction private func deleteCurrentInputed(_ sender: UIButton) {
        if isCalculateCompleted {
            resetCalculateOption()
        }
        
        operandLabel.text = "0"
        isOperandInputed = false
    }
    
    @IBAction private func changeTheSign(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard let operand = Double(getText(operandLabel.text)), operand != 0.0 else {
            return
        }
        
        operandLabel.text = checkTheSign(getText(operandLabel.text))
    }
    
    @IBAction private func appendOperator(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard isOperandInputed else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        operatorLabel.text = sender.currentTitle
        let operatorOfSignLabel = createLabel(text: getText(operatorLabel.text))
        let operandOfSignLabel = createLabel(text: getText(operandLabel.text))
        
        if fomulaStackView.subviews.isEmpty {
            createStackView(operandOfSignLabel)
            addFomula()
        } else {
            createStackView(operatorOfSignLabel, operandOfSignLabel)
            addFomula()
        }
        
        operandLabel.text = "0"
        isOperandInputed = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.downScroll()
        }
    }
    
    @IBAction private func appendOperand(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        
        if !isOperandInputed {
            operandLabel.text = getText(sender.currentTitle)
            isOperandInputed = true
        } else {
            operandLabel.text = getText(operandLabel.text) + getText(sender.currentTitle)
            isOperandInputed = true
        }
    }
    
    @IBAction private func calculateCurrentFormula(_ sender: UIButton) {
        guard isOperandInputed else {
            return
        }
        guard !fomulaStackView.subviews.isEmpty else {
            return
        }
        
        let operatorOfSignLabel = createLabel(text: getText(operatorLabel.text))
        let operandOfSignLabel = createLabel(text: getText(operandLabel.text))
        createStackView(operatorOfSignLabel, operandOfSignLabel)
        addFomula()
        operandLabel.text = calculate(inputedFomula)
        
        operatorLabel.text = ""
        inputedFomula = "0"
        isOperandInputed = false
        isCalculateCompleted = true
    }
    
    private func resetCalculateOption() {
        fomulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        inputedFomula = "0"
        isOperandInputed = false
        isCalculateCompleted = false
    }
    
    private func createLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    private func createStackView(_ labels: UIView...) {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        for label in labels {
            stackView.addArrangedSubview(label)
        }
        
        fomulaStackView.addArrangedSubview(stackView)
    }
    
    private func calculate(_ input: String) -> String? {
        var fomula = ExpressionParser.parse(from: input)
        
        do {
            let result = try fomula.result().parse()
            return result
        } catch CalculateError.infinityError {
            return "NaN"
        } catch CalculateError.nilError {
            return "NaN"
        } catch {
            return "NaN"
        }
    }
    
    private func getText(_ string: String?) -> String {
        guard let text = string else {
            return ""
        }
        return text
    }
    
    private func addFomula() {
        inputedFomula += " \(getText(operatorLabel.text)) \(getText(operandLabel.text))"
    }
    
    private func downScroll() {
        fomulaScrollView.setContentOffset(CGPoint(x: 0, y: fomulaScrollView.contentSize.height - fomulaScrollView.bounds.height), animated: false)
    }
    
    private func checkTheSign(_ input: String) -> String {
        var result = ""
        if input.contains("-") {
            result = input.filter{ $0 != "-" }
            return result
        } else {
            result = "-" + input
            return result
        }
    }
}
