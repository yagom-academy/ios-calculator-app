//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var isOperandInputted = false
    private var isCalculateCompleted = false
    private var inputtedFomula = ""
    
    @IBOutlet private weak var fomulaScrollView: UIScrollView!
    @IBOutlet private weak var fomulaStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Button Action
    @IBAction private func setToDefault(_ sender: UIButton) {
        resetCalculateOption()
    }
    
    @IBAction private func deleteCurrentInputed(_ sender: UIButton) {
        if isCalculateCompleted {
            resetCalculateOption()
        }
        
        operandLabel.text = "0"
        isOperandInputted = false
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
    
    @IBAction private func appendOperand(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        
        if !isOperandInputted {
            operandLabel.text = getText(sender.currentTitle)
        } else {
            operandLabel.text = getText(operandLabel.text) + getText(sender.currentTitle)
        }
        isOperandInputted = true
    }
    
    @IBAction private func appendOperator(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard isOperandInputted else {
            operatorLabel.text = sender.currentTitle
            return
        }
        guard Double(getText(operandLabel.text)) != nil else {
            operandLabel.text = "NaN"
            isOperandInputted = false
            return
        }
        
        let operatorOfSignLabel = createLabel(text: getText(sender.currentTitle))
        let operandOfSignLabel = createLabel(text: changeFormat(getText(operandLabel.text)))
        operatorLabel.text = sender.currentTitle
        
        if fomulaStackView.subviews.isEmpty {
            createStackView(operandOfSignLabel)
        } else {
            createStackView(operatorOfSignLabel, operandOfSignLabel)
        }
        
        addInputtedFomula()
        operandLabel.text = "0"
        isOperandInputted = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.downScroll()
        }
    }
    
    @IBAction private func calculateCurrentFormula(_ sender: UIButton) {
        guard isOperandInputted else {
            return
        }
        guard !fomulaStackView.subviews.isEmpty else {
            return
        }
        
        let operatorOfSignLabel = createLabel(text: getText(operatorLabel.text))
        let operandOfSignLabel = createLabel(text: getText(operandLabel.text))
        createStackView(operatorOfSignLabel, operandOfSignLabel)
        addInputtedFomula()
        operandLabel.text = calculate(inputtedFomula)
        operatorLabel.text = ""
        inputtedFomula = ""
        isOperandInputted = false
        isCalculateCompleted = true
    }
    
    //MARK: - Internal Logic
    private func resetCalculateOption() {
        fomulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        inputtedFomula = ""
        isOperandInputted = false
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
    
    private func addInputtedFomula() {
        if inputtedFomula.isEmpty {
            inputtedFomula = "\(getText(operandLabel.text))"
        } else {
            inputtedFomula += " \(getText(operatorLabel.text)) \(getText(operandLabel.text))"
        }
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
    
    private func changeFormat(_ input: String) -> String {
        return (Double(input) ?? 0).parse()
    }
}
