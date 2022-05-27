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
        guard let operand = Double(operandLabel.text?.filter { $0 != ","  } ?? ""), operand != 0.0 else {
            return
        }
        
        operandLabel.text = checkTheSign(getText(operandLabel))
    }
    
    @IBAction private func appendOperand(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard let sederTitle = sender.currentTitle else{
            return
        }
        
        if !isOperandInputted {
            operandLabel.text = sederTitle
        } else {
            operandLabel.text = checkOperand(getText(operandLabel), with: sederTitle)
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
        guard Double(getText(operandLabel).filter { $0 != "," }) != nil else {
            operandLabel.text = "NaN"
            isOperandInputted = false
            return
        }
        guard let sederTitle = sender.currentTitle else{
            return
        }
        
        let operatorOfSignLabel = createLabel(text: sederTitle)
        let operandOfSignLabel = createLabel(text: changeFormat(getText(operandLabel)))
        operatorLabel.text = sederTitle
        
        if fomulaStackView.subviews.isEmpty {
            createStackView(operandOfSignLabel)
        } else {
            createStackView(operatorOfSignLabel, operandOfSignLabel)
        }
        
        addInputtedFomula()
        operandLabel.text = "0"
        isOperandInputted = false
        downScroll()
    }
    
    @IBAction private func calculateCurrentFormula(_ sender: UIButton) {
        guard isOperandInputted else {
            return
        }
        guard Double(getText(operandLabel).filter { $0 != "," }) != nil else {
            operandLabel.text = "NaN"
            isOperandInputted = false
            return
        }
        guard !fomulaStackView.subviews.isEmpty else {
            return
        }
        
        let operatorOfSignLabel = createLabel(text: getText(operatorLabel))
        let operandOfSignLabel = createLabel(text: changeFormat(getText(operandLabel)))
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
    
    private func getText(_ label: UILabel) -> String {
        guard let text = label.text else {
            return ""
        }
        return text
    }
    
    private func addInputtedFomula() {
        if inputtedFomula.isEmpty {
            inputtedFomula = "\(getText(operandLabel).filter { $0.isNumber })"
        } else {
            inputtedFomula += " \(getText(operatorLabel)) \(getText(operandLabel).filter { $0.isNumber })"
        }
    }
    
    private func downScroll() {
        fomulaScrollView.layoutIfNeeded()
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
        let result = input.filter { $0 != ","  }
        return (Double(result) ?? 0).parse()
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
}
