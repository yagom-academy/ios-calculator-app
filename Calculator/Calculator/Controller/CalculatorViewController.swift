//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var currentNumbersLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    private var mathExpression: String = ""
    private var selectedNumbers: String = ""
    private var selectedOperator: String = ""
    private var didNotCalculate: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetExpression()
        resetLabels()
    }
    
    @IBAction func didTappedNumberButton(_ sender: UIButton) {
        guard didNotCalculate else {
            return
        }
        
        if selectedNumbers.isEmpty {
            appendExpressionFromOperator()
        }
        
        guard let inputNumber = sender.titleLabel?.text else {
            return
        }
        
        appendNumbers(inputNumber)
        changeNumberLabel(selectedNumbers)
    }
    
    @IBAction func didTappedOperatorButton(_ sender: UIButton) {
        
        guard didNotCalculate else {
            return
        }
        
        appendExpressionFromNumbers()
        changeNumbers("")

        guard let inputedOperator = sender.titleLabel?.text else {
            return
        }
        
        changeOperator(inputedOperator)
        changeOperatorLabel(selectedOperator)
    }
    
    @IBAction func didTappedEqualButton(_ sender: UIButton) {
        guard didNotCalculate else {
            return
        }
        
        guard let lastElement = mathExpression.last else {
            return
        }
        
        if lastElement.shouldConvertOperator {
            appendExpressionFromNumbers()
        }
        
        calculateExpression()
        
        convertDidCalculate()
    }
    
    @IBAction func didTappedACButton(_ sender: UIButton) {
        resetLabels()
        resetExpression()
        resetMathExpression()
        
        if !didNotCalculate {
            convertDidCalculate()
        }
    }
    
    @IBAction func didTappedCEButton(_ sender: UIButton) {
        print(mathExpression, selectedOperator)
        guard didNotCalculate else {
            resetLabels()
            resetExpression()
            resetMathExpression()
            
            return
        }

        guard let lastElement = mathExpression.last else {
            return
        }

        guard lastElement.shouldConvertOperator else {
            return
        }
        
        changeNumbers("")
        changeNumberLabel("0")
        changeOperator("")
    }
    
    @IBAction func didTappedConvertSign(_ sender: UIButton) {
        guard selectedNumbers.isNotEmpty else {
            return
        }
        
        if selectedNumbers.contains("-") {
            selectedNumbers.remove(at: selectedNumbers.startIndex)
        } else {
            selectedNumbers.insert("-", at: selectedNumbers.startIndex)
        }
        
        changeNumbers(selectedNumbers)
        changeNumberLabel(selectedNumbers)
    }
    private func calculateExpression() {
        let formula = ExpressionParser.parse(from: mathExpression)
        
        do {
            let calculatedValue = try formula.result()
            changeLabels(calculatedValue.description, "")
            resetExpression()
        } catch {
            // TODO: -에러처리하기
            print(error)
        }
    }
    
    private func convertDidCalculate() {
        didNotCalculate = !didNotCalculate
    }
    
    private func resetLabels() {
        changeLabels("0", "")
    }
    
    private func resetExpression() {
        changeExpression("", "")
    }
    
    private func changeLabels(_ numbers: String, _ operators: String) {
        changeNumberLabel(numbers)
        changeOperatorLabel(operators)
    }
    
    private func changeExpression(_ numbers: String, _ operators: String) {
        changeNumbers(numbers)
        changeOperator(operators)
    }
    
    private func changeNumberLabel(_ input: String) {
        currentNumbersLabel.text = input
    }
    
    private func changeOperatorLabel(_ input: String) {
        currentOperatorLabel.text = input
    }
    
    private func changeNumbers(_ input: String) {
        selectedNumbers = input
    }
    
    private func appendNumbers(_ input: String) {
        selectedNumbers.append(input)
    }
    
    private func changeOperator(_ input: String) {
        selectedOperator = input
    }
    
    private func appendExpressionFromNumbers() {
        mathExpression.append(selectedNumbers)
    }
    
    private func appendExpressionFromOperator() {
        mathExpression.append(selectedOperator)
    }
    
    private func resetMathExpression() {
        mathExpression = ""
    }
}
