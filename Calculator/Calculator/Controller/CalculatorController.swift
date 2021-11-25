//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    
    //MARK: - Properties
    
    var calculatorManager = CalculatorManager()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorManager.delegate = self
    }
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {
            return
        }
        calculatorManager.tapNumberPad(operand)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
        calculatorManager.tapOperatorButton(`operator`)
        scrollToButtom(scrollView: formulaScrollView)
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        calculatorManager.tapDotButton()
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        calculatorManager.tapPlusMinusButton()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        calculatorManager.tapCEButton()
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        calculatorManager.tapACButton()
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        calculatorManager.tapEqualButton()
    }
    
    //MARK: - Helpers
    
    private func formulaLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
    
    private func scrollToButtom(scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.frame.height)
        scrollView.setContentOffset(bottomOffset, animated: false)
    }
}

extension CalculatorController: CalculatorManagerDelegate {
    func updateOperandLabel(with newOperand: String) {
        operandLabel.text = newOperand
    }
    
    func updateOperatorLabel(with newOperator: String) {
        operatorLabel.text = newOperator
    }
    
    func addFormulaStackView(operand: String, operator: String) {
        let stackView = UIStackView(arrangedSubviews: [formulaLabel(with: `operator`), formulaLabel(with: operand)])
        stackView.axis = .horizontal
        stackView.spacing = 8
        formulaStackView.addArrangedSubview(stackView)
    }
    
    func clearFormulaStackView() {
        formulaStackView.subviews.forEach { $0.removeFromSuperview() }
    }
}
