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
            mathExpression.append(selectedOperator)
        }
        selectedNumbers.append(inputNumber)
        updateNumberLabelTo(numbers: selectedNumbers.calNumber)
    }
    
    @IBAction func didTappedOperatorButton(_ sender: UIButton) {
        guard didNotCalculate,
              let inputedOperator = sender.titleLabel?.text else {
            return
        }
        
        if selectedNumbers.isNotEmpty {
            addLogStackView()
        }
        
        mathExpression.append(selectedNumbers)
        resetSelectedNumbers()
        
        selectedOperator = inputedOperator
        
        updateOperatorLabel()
        resetNumberLabel()
    }
    
    @IBAction func didTappedEqualButton(_ sender: UIButton) {
        guard didNotCalculate else {
            return
        }
        
        if selectedNumbers.isEmpty {
            resetSelectedNumbers()
            mathExpression.append(selectedOperator)
            mathExpression.append(selectedNumbers)
        }
        
        addLogStackView()
        
        guard let lastElement = mathExpression.last else {
            return
        }
        
        if !lastElement.shouldConvertOperator {
            mathExpression.append(selectedOperator)
        }

        mathExpression.append(selectedNumbers)
        
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
        
        resetSelectedNumbers()
        resetNumberLabel()
    }
    
    @IBAction func didTappedPointButton(_ sender: UIButton) {
        guard selectedNumbers.isNotEmpty else {
            return
        }
        
        selectedNumbers.append(Constant.Calculator.defaultPoint)
        updateNumberLabelTo(numbers: selectedNumbers)
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
        
        mathExpression.append(selectedNumbers)
        updateNumberLabelTo(numbers: selectedNumbers.calNumber)
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
    func addLogStackView() {
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
        resetSelectedNumbers()
        resetSelectedOperator()
    }
    
    func resetSelectedNumbers() {
        selectedNumbers = Constant.Calculator.defaultInput
    }
    
    func resetSelectedOperator() {
        selectedOperator = Constant.Calculator.defaultInput
    }
    
    func resetMathExpression() {
        mathExpression = Constant.Calculator.defaultInput
    }
    
    func calculateExpression() {
        let formula = ExpressionParser.parse(from: mathExpression)
        
        do {
            let calculatedValue = try formula.result()
            let calNumber = calculatedValue.description.calNumber
            
            updateNumberLabelTo(numbers: calNumber)
            resetOperatorLabel()
            
            resetExpression()
        } catch FormulaError.dividedByZero {
            let errorValue = Double.signalingNaN.description
            updateNumberLabelTo(numbers: errorValue)
        } catch {
            
        }
    }
}

// MARK: - 뷰 관련 메서드
private extension CalculatorViewController {
    func resetLabels() {
        resetNumberLabel()
        resetSelectedNumbers()
    }

    func resetNumberLabel() {
        currentNumbersLabel.text = Constant.Calculator.defaultNumber
    }
    
    func resetOperatorLabel() {
        currentOperatorLabel.text = Constant.Calculator.defaultOperator
    }
    
    func updateNumberLabelTo(numbers: String) {
        currentNumbersLabel.text = numbers
    }
    
    func updateOperatorLabel() {
        currentOperatorLabel.text = selectedOperator
    }
    
}
