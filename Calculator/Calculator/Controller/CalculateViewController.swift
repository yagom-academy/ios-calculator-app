//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
    //MARK: - Property
    @IBOutlet private weak var fomulaScrollView: UIScrollView!
    @IBOutlet private weak var fomulaStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    var calcultorInternalAction = CalculatorInternalAction()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Button Action
    @IBAction private func tabAcButton() {
        setCalculatorDefaultView()
        calcultorInternalAction.setDefaultValue()
    }
    
    @IBAction private func tabCeButton() {
        setCalculatorDefaultOperlandLabel()
    }
    
    @IBAction private func tabChangeTheSignButton() {
        changeTheSignOperandLabel()
    }
    
    @IBAction private func tabOperandButton(_ sender: UIButton) {
        setOperandLabel(with: sender.currentTitle)
    }
    
    @IBAction private func tabOperatorButton(_ sender: UIButton) {
        setOperatorLabel(with: sender.currentTitle)
    }
    
    @IBAction private func tabEqualButton() {
        setCalculationResult()
    }
    
    //MARK: - Internal Logic
    private func setCalculatorDefaultView() {
        fomulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = CalculatorDefaultValue.operandLabel
        operatorLabel.text = CalculatorDefaultValue.operatorLabel
    }
    
    private func setCalculatorDefaultOperlandLabel() {
        operandLabel.text = CalculatorDefaultValue.operandLabel
    }
    
    private func changeTheSignOperandLabel() {
        operandLabel.text = calcultorInternalAction.changeTheSign(operandLabel.text)
    }
    
    private func setOperandLabel(with currentTitle: String?) {
        guard !calcultorInternalAction.isCalculateCompleted else { return }
        operandLabel.text = calcultorInternalAction.appendOperand(operandLabel.text, currentTitle)
    }
    
    private func setOperatorLabel(with currentTitle: String?) {
        guard !calcultorInternalAction.isCalculateCompleted else { return }
        guard calcultorInternalAction.isOperandInputted else {
            operatorLabel.text = currentTitle
            return
        }
        
        let formula = calcultorInternalAction.appendFormula(operandLabel.text, currentTitle)
        operatorLabel.text = formula.currentOperator
        
        if fomulaStackView.subviews.isEmpty {
            createStackView(formula.currentOperand)
        } else {
            createStackView(formula.currentOperator, formula.currentOperand)
        }
        
        downScroll()
        operandLabel.text = CalculatorDefaultValue.operandLabel
    }
    
    private func setCalculationResult() {
        guard !fomulaStackView.subviews.isEmpty else { return }
        guard !calcultorInternalAction.isCalculateCompleted else { return }
        
        let fomula = calcultorInternalAction.appendFormula(operandLabel.text, operatorLabel.text)
        createStackView(fomula.currentOperator, fomula.currentOperand)
        operandLabel.text = calcultorInternalAction.calculate()
        operatorLabel.text = CalculatorDefaultValue.operatorLabel
    }
    
    private func createStackView(_ labels: String...) {
        let stackView = UIStackView()
        stackView.spacing = 8
        
        for label in labels {
            stackView.addArrangedSubview(createLabel(text: label))
        }
        
        fomulaStackView.addArrangedSubview(stackView)
    }
    
    private func downScroll() {
        fomulaScrollView.layoutIfNeeded()
        fomulaScrollView.setContentOffset(CGPoint(x: 0, y: fomulaScrollView.contentSize.height - fomulaScrollView.bounds.height), animated: false)
    }
    
    private func createLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        
        return label
    }
}
