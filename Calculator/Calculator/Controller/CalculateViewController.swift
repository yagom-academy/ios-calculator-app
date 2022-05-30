//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
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
        operandLabel.text = "0"
    }
    
    @IBAction private func changeTheSign(_ sender: UIButton) {
        guard let operandText = operandLabel.text, Double(operandText) != 0.0 else { return }
        guard let operand = Double(filterSign(operandText, ",")) else { return }
        
        operandLabel.text = String((operand * -1).parse())
    }
    
    @IBAction private func appendOperand(_ sender: UIButton) {
        guard !isCalculateCompleted else { return }
        guard let sederTitle = sender.currentTitle else { return }
        
        if !isOperandInputted {
            operandLabel.text = sederTitle
        } else {
            operandLabel.text = checkOperand(getText(operandLabel), with: sederTitle)
        }
        
        isOperandInputted = true
    }
    
    @IBAction private func appendOperator(_ sender: UIButton) {
        guard !isCalculateCompleted else { return }
        guard let sederTitle = sender.currentTitle else { return }
        guard isOperandInputted else {
            operatorLabel.text = sender.currentTitle
            return
        }
        guard Double(filterSign(getText(operandLabel), ",")) != nil else {
            operandLabel.text = "NaN"
            isOperandInputted = false
            return
        }
        
        operatorLabel.text = sederTitle
        
        if fomulaStackView.subviews.isEmpty {
            createStackView(changeFormat(getText(operandLabel)))
        } else {
            createStackView(sederTitle, changeFormat(getText(operandLabel)))
        }
        
        addInputtedFomula()
        downScroll()
        operandLabel.text = "0"
        isOperandInputted = false
    }
    
    @IBAction private func calculateCurrentFormula(_ sender: UIButton) {
        guard isOperandInputted else { return }
        guard !fomulaStackView.subviews.isEmpty else { return }
        guard Double(filterSign(getText(operandLabel), ",")) != nil else {
            operandLabel.text = "NaN"
            isOperandInputted = false
            return
        }
        
        createStackView(getText(operatorLabel), changeFormat(getText(operandLabel)))
        addInputtedFomula()
        operandLabel.text = calculate(inputtedFomula)
        operatorLabel.text = ""
        inputtedFomula = ""
        isOperandInputted = false
        isCalculateCompleted = true
    }
    
    //MARK: - Internal Logic
    private func createLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        
        return label
    }
    
    private func createStackView(_ labels: String...) {
        let stackView = UIStackView()
        stackView.spacing = 8
        
        for label in labels {
            stackView.addArrangedSubview(createLabel(text: label))
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
    
    private func getText(_ label: UILabel) -> String {
        guard let text = label.text else { return "" }
        
        return text
    }
    
    private func addInputtedFomula() {
        guard inputtedFomula.isEmpty else {
            inputtedFomula += " \(getText(operatorLabel)) \(filterSign(getText(operandLabel), ","))"
            return
        }
        
        inputtedFomula = "\(filterSign(getText(operandLabel), ","))"
    }
    
    private func downScroll() {
        fomulaScrollView.layoutIfNeeded()
        fomulaScrollView.setContentOffset(CGPoint(x: 0, y: fomulaScrollView.contentSize.height - fomulaScrollView.bounds.height), animated: false)
    }
    
    private func changeFormat(_ input: String) -> String {
        let result = filterSign(input, ",")
        
        return (Double(result) ?? 0).parse()
    }
    
    private func checkTheSign(_ input: String) -> String {
        guard input.contains("-") else { return "-" + input }
        
        return filterSign(input, "-")
    }
    
    private func checkOperand(_ currentlabel: String, with currentInput: String) -> String {
        if !currentlabel.contains(".") && currentInput == "." {
            return currentlabel + currentInput
        } else if currentlabel.contains(".") && currentInput.contains("0") {
            return currentlabel + currentInput
        } else {
            return changeFormat(currentlabel + currentInput)
        }
    }
    
    private func resetCalculateOption() {
        fomulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        inputtedFomula = ""
        isOperandInputted = false
        isCalculateCompleted = false
    }
    
    private func filterSign(_ input: String, _ sign: String.Element) -> String {
        return input.filter{$0 != sign}
    }
}
