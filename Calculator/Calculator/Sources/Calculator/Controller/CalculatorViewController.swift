//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var recordedCalculatedStackView: UIStackView!
    @IBOutlet private weak var currentNumbersLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
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
        guard didNotCalculate,
              let inputNumber = sender.titleLabel?.text else {
            return
        }
        
        if selectedNumbers.isEmpty {
            appendExpressionFromOperator()
        }
        
        appendNumbers(inputNumber)
        changeNumberLabel(selectedNumbers.calNumber)
    }
    
    @IBAction func didTappedOperatorButton(_ sender: UIButton) {
        guard didNotCalculate,
              let inputedOperator = sender.titleLabel?.text else {
            return
        }
        
        if selectedNumbers.isNotEmpty {
            addChildStackView()
        }
        
        appendExpressionFromNumbers()
        changeNumbers(Constant.Calculator.defaultNumber)
        
        changeOperator(inputedOperator)
        changeOperatorLabel(selectedOperator)
        changeNumberLabel()
    }
    
    @IBAction func didTappedEqualButton(_ sender: UIButton) {
        guard didNotCalculate else {
            return
        }
        
        if selectedNumbers.isEmpty {
            changeNumbers()
            appendExpressionFromOperator()
            appendExpressionFromNumbers()
        }
        
        addChildStackView()
        
        guard let lastElement = mathExpression.last else {
            return
        }
        
        if lastElement.shouldConvertOperator {
            appendExpressionFromNumbers()
        } else {
            appendExpressionFromOperator()
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
        
        removeAllChildStackView()
    }
    
    @IBAction func didTappedCEButton(_ sender: UIButton) {
        guard didNotCalculate else {
            resetLabels()
            resetExpression()
            resetMathExpression()
            removeAllChildStackView()
            convertDidCalculate()
            
            return
        }
        
        changeNumbers()
        changeNumberLabel()
    }
    
    @IBAction func didTappedPointButton(_ sender: UIButton) {
        guard selectedNumbers.isNotEmpty else {
            return
        }
        
        appendNumbers(Constant.Calculator.defaultPoint)
        changeNumberLabel(selectedNumbers)
    }
    
    
    @IBAction func didTappedConvertSign(_ sender: UIButton) {
        guard selectedNumbers.isNotEmpty,
              let firstElement = selectedNumbers.first else {
            return
        }
        
        let minusCharactor = Operator.subtract.rawValue
        
        if firstElement == minusCharactor {
            selectedNumbers.removeFirst()
        } else {
            selectedNumbers.insert(minusCharactor, at: selectedNumbers.startIndex)
        }
        
        changeNumbers(selectedNumbers)
        appendExpressionFromNumbers()
        changeNumberLabel(selectedNumbers.calNumber)
    }
}

// MARK: - RecordStackViewDelegate 관련 메서드
extension CalculatorViewController: RecordStackViewDelegate {
    func sendLabelTexts() -> (operatorValue: String, operand: String) {
        let operatorValue = selectedOperator.isEmpty ? Constant.Calculator.defaultInput : selectedOperator
        
        return (operatorValue, selectedNumbers.calNumber)
    }
}

// MARK: - StackView UI변경 관련 메서드
private extension CalculatorViewController {
    func addChildStackView() {
        let childView = CalculatedRecordStackView()
        childView.delegate = self
        childView.setUpStackView()
        
        recordedCalculatedStackView.addArrangedSubview(childView)
        scrollView.scrollToBottom()
    }
    
    func removeAllChildStackView() {
        recordedCalculatedStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

// MARK: - 계산기 사용자 입력 상태 관리 메서드
private extension CalculatorViewController {
    func convertDidCalculate() {
        didNotCalculate = !didNotCalculate
    }
    
    func resetExpression() {
        changeExpression(Constant.Calculator.defaultInput, Constant.Calculator.defaultInput)
    }
    
    func changeExpression(_ numbers: String, _ operators: String) {
        changeNumbers(numbers)
        changeOperator(operators)
    }
    
    func changeNumbers(_ input: String = Constant.Calculator.defaultInput) {
        selectedNumbers = input
    }
    
    func appendNumbers(_ input: String) {
        selectedNumbers.append(input)
    }
    
    func changeOperator(_ input: String = Constant.Calculator.defaultInput) {
        selectedOperator = input
    }
    
    func appendExpressionFromNumbers() {
        mathExpression.append(selectedNumbers)
    }
    
    func appendExpressionFromOperator() {
        mathExpression.append(selectedOperator)
    }
    
    func resetMathExpression() {
        mathExpression = Constant.Calculator.defaultInput
    }
    
    func calculateExpression() {
        let formula = ExpressionParser.parse(from: mathExpression)
        print(formula)
        do {
            let calculatedValue = try formula.result()
            let calNumber = calculatedValue.description.calNumber
            
            changeLabels(calNumber, "")
            resetExpression()
        } catch FormulaError.dividedByZero {
            let errorValue = Double.signalingNaN.description
            
            changeNumberLabel(errorValue)
        } catch {
            
        }
    }
}

// MARK: - 뷰 관련 메서드
private extension CalculatorViewController {
    func resetLabels() {
        changeLabels(Constant.Calculator.defaultNumber, Constant.Calculator.defaultOperator)
    }
    
    func changeLabels(_ numbers: String, _ operators: String) {
        changeNumberLabel(numbers)
        changeOperatorLabel(operators)
    }
    
    func changeNumberLabel(_ input: String = Constant.Calculator.defaultNumber) {
        currentNumbersLabel.text = input
    }
    
    func changeOperatorLabel(_ input: String = Constant.Calculator.defaultOperator) {
        currentOperatorLabel.text = input
    }
}
