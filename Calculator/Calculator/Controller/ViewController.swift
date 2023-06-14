//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

let maximumDecimalDigits = 5
let maximumOperandDigits = 20

class ViewController: UIViewController {
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
        
        var parsedExpression = ExpressionParser.parser(from: expression.withoutDecimalPoint)
        
        do {
            let result = try parsedExpression.result()
            
            let formattingResult = operandFormatter.string(for: result)
            operandLabel.text = formattingResult
            initOperatorLabel()
            isResult = true
        } catch CalculatorError.notANumber {
            operandLabel.text = CalculatorError.notANumber.errorDescription
            initExpression()
            initOperatorLabel()
        } catch {
            print("알 수 없는 오류")
        }
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
            operandLabel.text = operandFormatter.string(for: Double(changedSignNumber))
        }
    }
    
}

extension ViewController {
    func initializeCalculator() {
        initExpression()
        initOperandLabel()
        initOperatorLabel()
        removeStackView()
        isResult = false
    }
    
    func initOperandLabel() {
        operandLabel.text = "0"
    }
    
    func initOperatorLabel() {
        operatorLabel.text = ""
    }
    
    func initExpression() {
        expression = ""
    }

}

extension ViewController {
    func addStackView(_ currentOperator: String, _ currentOperand: String)  {
        let operandUILabel = createUILabel(text: currentOperand)
        let operatorUILabel = createUILabel(text: currentOperator)
            
        let stackView = createUIStackView(operatorUILabel, operandUILabel)
        calculateStackView.addArrangedSubview(stackView)
        
        scrollToBottom()
    }
    
    func removeStackView() {
        calculateStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    func createUIStackView(_ labels: UILabel...) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 10
        
        labels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
    
    func scrollToBottom() {
        calculateHistoryScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: (calculateHistoryScrollView.contentSize.height - calculateHistoryScrollView.bounds.size.height))

        calculateHistoryScrollView.setContentOffset(bottomOffset, animated: true)
    }
}
