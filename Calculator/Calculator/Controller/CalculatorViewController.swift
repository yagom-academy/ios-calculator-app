//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/13.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        let operandText = unwrap(operandLabel.text)
        
        operandLabel.text = calculator.numberButtonLogic(operandText, labelText)
    }
    
    @IBAction func tapZeroButton(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        let operandText = unwrap(operandLabel.text)
        
        operandLabel.text = calculator.zeroButtonLogic(operandText, labelText)
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        let operandText = unwrap(operandLabel.text)
        
        operandLabel.text = calculator.dotButtonLogic(operandText, labelText)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        let operatorText = unwrap(operatorLabel.text)
        let operandText = unwrap(operandLabel.text)
        let labelText = unwrap(sender.titleLabel?.text)
        let formulaStackViewCount = formulaStackView.subviews.count
        
        if operandText.isZero, formulaStackView.subviews.isEmpty {
            return
        }
        
        operatorLabel.text = calculator.operatorButtonLogic(operatorText, operandText, labelText, formulaStackView)
        
        if formulaStackViewCount < formulaStackView.subviews.count {
            resetOperandLabel()
            formulaScrollView.scrollToBottom()
        }
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        let operatorText = unwrap(operatorLabel.text)
        let operandText = unwrap(operandLabel.text)
        let formulaStackViewCount = formulaStackView.subviews.count
        
        do {
            operandLabel.text = try calculator.equalButtonLogic(operatorText, operandText, formulaStackView)
        } catch let error as OperationError {
            if error == .divideByZeroError {
                operandLabel.text = "NaN"
            }
            
            print(error)
        } catch {
            print(CalculatorError.unexpectedError)
        }
        
        if formulaStackViewCount < formulaStackView.subviews.count {
            resetOperatorLabel()
            formulaScrollView.scrollToBottom()
        }
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        let operandText = unwrap(operandLabel.text)
        
        operandLabel.text = calculator.changeSignButtonLogic(operandText)
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        if calculator.isOperationReady == false {
            resetFormulaStackView()
        }
        
        resetOperandLabel()
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "0"
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetFormulaStackView() {
        formulaStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func unwrap(_ text: String?) -> String {
        return text ?? ""
    }
}
