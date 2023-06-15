//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var expression: String = String()
    private var operandFormatter = OperandFormatter()
    private var isResult: Bool = false
    
    @IBOutlet weak var calculateHistoryScrollView: UIScrollView!
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCalculator()
    }

    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let inputedOperand = sender.titleLabel?.text,
              var currentOperand = operandLabel.text,
              let currentOperator = operatorLabel.text else {
            return
        }
        
        if isResult {
            initializeCalculator()
            currentOperand = "0"
        }
        
        if currentOperator.isEmpty == false {
            expression += currentOperator
        }
        
        operandLabel.text = operandFormatter.formattingOperand(inputedOperand, currentOperand)
    }

    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let inputedOperator = sender.titleLabel?.text,
              let currentOperator = operatorLabel.text,
              let currentOperand = operandLabel.text else {
            return
        }
        
        if isResult && currentOperand.isZero == false, currentOperand.isNaN == false {
            addStackView(currentOperator, currentOperand)
            expression += currentOperand
            initOperandLabel()
            operatorLabel.text = inputedOperator
            isResult = false
            return
        }
        
        if isResult { return }

        if currentOperand.isZero {
            operatorLabel.text = inputedOperator
        } else {
            addStackView(currentOperator, currentOperand)
            expression += currentOperand
            initOperandLabel()
            operatorLabel.text = inputedOperator
        }
    }
        
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        guard isResult == false,
              let currentOperand = operandLabel.text,
              let currentOperator = operatorLabel.text else {
            return
        }
        
        if currentOperand.isZero && currentOperator.isEmpty == false {
            expression += currentOperator
        }
        
        if currentOperand.isEmpty == false {
            expression += currentOperand
        }
 
        addStackView(currentOperator, currentOperand)
        calculate()
    }
    
    //AC: All Clear
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        initializeCalculator()
    }
    
    //CE: Clear Entry
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        initOperandLabel()
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
              currentOperand.isZero == false && isResult == false else {
            return
        }

        if let number = Double(currentOperand.withoutDecimalPoint) {
            let changedSignNumber = number.sign == .plus ? -number : abs(number)
            operandLabel.text = operandFormatter.numberToString(for: Double(changedSignNumber))
        }
    }
    
}

// MARK: - Private Method
extension CalculatorViewController {
    private func initializeCalculator() {
        initExpression()
        initOperandLabel()
        initOperatorLabel()
        removeStackView()
        isResult = false
    }
    
    private func initOperandLabel() {
        operandLabel.text = "0"
    }
    
    private func initOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func initExpression() {
        expression = ""
    }
    
    private func calculate() {
        var parsedExpression = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: expression.withoutDecimalPoint)
        
        do {
            let result = try parsedExpression.result()
            
            let formattingResult = operandFormatter.numberToString(for: result)
            operandLabel.text = formattingResult
            initExpression()
            initOperatorLabel()
            isResult = true
        } catch CalculatorError.notANumber {
            operandLabel.text = CalculatorError.notANumber.errorDescription
            initExpression()
            initOperatorLabel()
            isResult = true
        } catch {
            print("알 수 없는 오류")
        }
    }
}

// MARK: - StackView Method
extension CalculatorViewController {
    private func addStackView(_ currentOperator: String, _ currentOperand: String)  {
        let stackView = createUIStackView(currentOperator, currentOperand)
        calculateStackView.addArrangedSubview(stackView)
        calculateHistoryScrollView.layoutIfNeeded()
        scrollToBottom()
    }
    
    private func removeStackView() {
        calculateStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func createUIStackView(_ currentOperator: String, _ currentOperand: String) -> UIStackView {
        let labels = [createUILabel(text: currentOperator), createUILabel(text: currentOperand)]
        
        let stackView = UIStackView()
        stackView.spacing = 10
        
        labels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: (calculateHistoryScrollView.contentSize.height - calculateHistoryScrollView.bounds.size.height))

        calculateHistoryScrollView.setContentOffset(bottomOffset, animated: true)
    }
}
