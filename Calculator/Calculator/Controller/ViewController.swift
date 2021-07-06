//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var operandInputLabel: UILabel!
    @IBOutlet weak var operatorInputLabel: UILabel!
    @IBOutlet weak var equalSignButton: UIButton!
    @IBOutlet weak var equationsStackView: UIStackView!
    @IBOutlet weak var equationScrollView: UIScrollView!
    private var currentNumber: String = .zero {
        didSet {
            operandInputLabel.text = currentNumber
        }
    }
    private var currentOperator: String = .empty {
        didSet {
            operatorInputLabel.text = currentOperator
        }
    }
    let calculator = Calculator()
    var isInNaNState = false
    let maximumInputLength = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperandInputLabel()
        resetOperatorInputLabel()
    }
}

extension ViewController {
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard !isInNaNState,
              let number = sender.currentTitle,
              currentNumber.count <= maximumInputLength else {
            return
        }
        if isCurrentNumberZero() {
            currentNumber = number
        } else {
            currentNumber.append(number)
        }
    }
    
    @IBAction func tapHundredButton(_ sender: UIButton) {
        guard !isInNaNState,
              let doubleZero = sender.currentTitle else {
            return
        }
        if !isCurrentNumberZero() {
            currentNumber.append(doubleZero)
        }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if !isInNaNState && !isCurrentNumberFloatingPoint() {
            currentNumber.append(.dot)
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard !isInNaNState,
              let operatorSymbol = sender.currentTitle else {
            return
        }
        if !isCurrentNumberZero() {
            calculator.putIntoInfixExpression(of: currentOperator)
            calculator.putIntoInfixExpression(of: currentNumber)
            addOperatorAndOperandToEquationsStackView()
            resetOperandInputLabel()
        }
        currentOperator = operatorSymbol
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        guard !isInNaNState,
              calculator.isAbleToCalculate else {
            return
        }
        calculator.putIntoInfixExpression(of: currentOperator)
        calculator.putIntoInfixExpression(of: currentNumber)
        addOperatorAndOperandToEquationsStackView()
        let calculationResult = calculator.deriveEquationValue()
        switch calculationResult {
        case .success(let numberResult):
            process(numberResult)
        case .failure(let error):
            process(error)
        }
        resetOperatorInputLabel()
        calculator.clearAll()
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        switch buttonTitle {
        case .allClear:
            resetOperandInputLabel()
            resetOperatorInputLabel()
            removeAllEquationStackView()
            calculator.clearAll()
        case .clearEntry:
            resetOperandInputLabel()
        default:
            break
        }
        isInNaNState = false
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        guard !isInNaNState,
              currentNumber != .zero else {
            return
        }
        if !isCurrentNumberNegative() {
            currentNumber = .hyphenMinus + currentNumber
        } else {
            currentNumber.removeFirst()
        }
    }
}

extension ViewController {
    private func resetOperandInputLabel() {
        currentNumber = .zero
    }
    
    private func resetOperatorInputLabel() {
        currentOperator = .empty
    }
    
    private func isCurrentNumberZero() -> Bool {
        currentNumber == .zero
    }
    
    private func isCurrentNumberFloatingPoint() -> Bool {
        currentNumber.contains(String.dot)
    }
    
    private func isCurrentNumberNegative() -> Bool {
        currentNumber.hasPrefix(.hyphenMinus)
    }
}

extension ViewController {
    private func process(_ numberResult: Double) {
        currentNumber = String(numberResult)
        operandInputLabel.text = expressInThousands(of: numberResult)
    }
    
    private func process(_ error: CalculatorError) {
        let message = error.localizedDescription
        switch error {
        case .divideByZero:
            currentNumber = message
            isInNaNState = true
        default:
            presentAlert(with: message)
            resetOperandInputLabel()
        }
    }
    
    private func expressInThousands(of number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = maximumInputLength
        numberFormatter.maximumIntegerDigits = maximumInputLength
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) else {
            return String(number)
        }
        return formattedNumber
    }
    
    private func presentAlert(with message: String) {
        let title = "오류 발생"
        let confirm = "확인"
        let errorAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAlertAction = UIAlertAction(title: confirm, style: .default, handler: nil)
        errorAlertController.addAction(confirmAlertAction)
        self.present(errorAlertController, animated: true, completion: nil)
    }
    
    private func addOperatorAndOperandToEquationsStackView() {
        let equationStackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        operatorLabel.text = currentOperator
        operatorLabel.textColor = .white
        operandLabel.text = currentNumber
        operandLabel.textColor = .white
        equationStackView.addArrangedSubview(operatorLabel)
        equationStackView.addArrangedSubview(operandLabel)
        equationsStackView.spacing = 8
        equationsStackView.addArrangedSubview(equationStackView)
        var bottomOffset = CGPoint(x: 0, y: equationScrollView.contentSize.height - equationScrollView.bounds.height + equationScrollView.contentInset.bottom)
        bottomOffset.y += bottomOffset.y > 0 ? view.safeAreaInsets.bottom : 0
        equationScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func removeAllEquationStackView() {
        equationsStackView.arrangedSubviews.enumerated().forEach { index, stackView in
            if index != 0 {
                stackView.removeFromSuperview()
            }
        }
    }
}
