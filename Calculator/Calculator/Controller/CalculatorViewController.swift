//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recordedCalculatedStackView: UIStackView!
    @IBOutlet weak var currentNumbersLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    private let defaultNumberLabelValue: String = Constant.Calculator.defaultNumberLabelValue
    private let defaultOperatorLabelValue: String = Constant.Calculator.defaultOperatorLabelValue
    private let defaultInputValue: String = Constant.Calculator.defaultInput
    
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
        
        guard let inputedOperator = sender.titleLabel?.text else {
            return
        }
        
        if selectedNumbers.isNotEmpty {
            addChildStackView()
        }
        
        appendExpressionFromNumbers()
        changeNumbers()
        
        changeOperator(inputedOperator)
        changeOperatorLabel(selectedOperator)
        changeNumberLabel()
    }
    
    private func addChildStackView() {
        let operatorValue = selectedOperator.isEmpty ? Constant.Calculator.defaultInput : selectedOperator
        
        let childView = CalculatedRecordStackView(operatorValue, selectedNumbers.calNumber)
        
        recordedCalculatedStackView.addArrangedSubview(childView)
        scrollView.scrollToBottom()
    }
    
    private func removeAllChildStackView() {
        recordedCalculatedStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
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
        changeNumberLabel(selectedNumbers)
    }
    
    private func calculateExpression() {
        let formula = ExpressionParser.parse(from: mathExpression)
        
        do {
            let calculatedValue = try formula.result()
            changeLabels(calculatedValue.description, "")
            resetExpression()
        } catch FormulaError.dividedByZero {
            let errorValue = Double.signalingNaN.description
            
            changeNumberLabel(errorValue)
        } catch {
            
        }
    }
}

// MARK: - 계산기 사용자 입력 상태 관리 메서드
private extension CalculatorViewController {
    func convertDidCalculate() {
        didNotCalculate = !didNotCalculate
    }
    
    func resetExpression() {
        changeExpression(defaultInputValue, defaultInputValue)
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
        mathExpression = defaultInputValue
    }
}

// MARK: - 뷰 관련 메서드
private extension CalculatorViewController {
    func resetLabels() {
        changeLabels(defaultNumberLabelValue,defaultOperatorLabelValue)
    }
    
    func changeLabels(_ numbers: String, _ operators: String) {
        changeNumberLabel(numbers)
        changeOperatorLabel(operators)
    }
    
    func changeNumberLabel(_ input: String = Constant.Calculator.defaultInput) {
        currentNumbersLabel.text = input.calNumber
    }
    
    func changeOperatorLabel(_ input: String = Constant.Calculator.defaultInput) {
        currentOperatorLabel.text = input
    }
}
