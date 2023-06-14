//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentFormulaStackView: UIStackView!
    @IBOutlet weak var currentFormulaScrollView: UIScrollView!
    
    private var calculatorManager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeOperandLabel()
        initializeOperatorLabel()
    }
    
    //MARK: - IBAction
    
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              let labelText = calculatorManager.verifyOperandLabel(currentLabel: operandLabelText, buttonNumber: number) else {
            return
        }
        
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard let button = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              let labelText = calculatorManager.verifyDotButton(currentLabel: operandLabelText, buttonText: button) else {
            return
        }
        
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let number = sender.currentTitle,
              let labelText = calculatorManager.verifyZeroButton(currentLabel: operandLabelText, buttonNumber: number) else {
            return
        }
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let operatorText = sender.currentTitle,
              let labelText = calculatorManager.verifyOperatorButton(currentLabel: operandLabelText, button: operatorText) else {
            currentOperatorLabel.text = sender.currentTitle
            return
        }
        
        addCurrentFormula()
        initializeOperandLabel()
        currentOperatorLabel.text = labelText
    }
    // = 버튼 함수
    @IBAction func tappedResultButton(_ sender: UIButton) { // calculatorManager 메서드 호출
        guard let operandLabelText = currentOperandLabel.text,
                let labelText = calculatorManager.verifyResultButton(currentLabel: operandLabelText) else {
            return
        }
        
        addCurrentFormula()
        initializeOperatorLabel()
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedChangeSignButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let labelText = calculatorManager.verifySignButton(currentLabel: operandLabelText) else {
            return
        }

        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedClearButton(_ sender: UIButton) {
        calculatorManager.clearButton()
        initializeOperandLabel()
    }
    
    @IBAction func tappedAllClearButton(_ sender: UIButton) {
        currentFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        calculatorManager.allClearButton()
        initializeOperandLabel()
        initializeOperatorLabel()
    }
    
    // MARK: - Methods
    
    private func initializeOperandLabel() {
        currentOperandLabel.text = "0"
    }
    
    private func initializeOperatorLabel() {
        currentOperatorLabel.text = ""
    }
    
    private func addCurrentFormula() {
        guard let operatorString = currentOperatorLabel.text,
              let operandString = currentOperandLabel.text else {
            return
        }
        
        setCurrentFormulaViewOnScroll(operatorString, FormManager.transformResult(from: operandString))
    }
}

extension CalculateViewController {
    private func makeCurrentFormulaLabelStackView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = UILabel(text: `operator`)
        let operandLabel: UILabel = UILabel(text: operand)
        return UIStackView(firstLabel: operatorLabel, secondLabel: operandLabel)
    }
    
    private func setCurrentFormulaViewOnScroll(_ `operator`: String, _ operand: String) {
        currentFormulaStackView.addArrangedSubview(makeCurrentFormulaLabelStackView(`operator`, operand))
        
        currentFormulaScrollView.layoutIfNeeded()
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
}
