//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

let initialNumber = 0
let maximumPointDigits = 5
let maximumOperandDigits = 20

final class CalculatorViewController: UIViewController {
    private var inputFormula: String = String()
    private var numberFormatter = NumberFormatter()
    private lazy var operandFormatter = OperandFormatter(numberFormatter)
    private var isResult: Bool = false
    private var isFirstArithmeticFormula: Bool {
        return calculateStackView.subviews.count == 0
    }
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var calculateHistoryScrollView: UIScrollView!
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCalculator()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 5
        calculateButton.isEnabled = false
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let inputedOperand = sender.currentTitle,
              var currentOperand = operandLabel.text?.withoutDecimalPoint else { return }
        
        if isResult {
            appendFormulaOrInitialize()
            currentOperand = "\(initialNumber)"
        }
        
        guard let operandLabelText = operandFormatter.setUpInputOperandText(currentOperand, inputedOperand) else { return }
        
        operandLabel.text = operandLabelText
    }

    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text?.isZero == false else {
            operatorLabel.text = isFirstArithmeticFormula ? "" : sender.currentTitle
            return
        }
        
        if isResult == true { initExpression() }
        
        addStackView()
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "\(initialNumber)"
        calculateButton.isEnabled = true
    }
        
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        guard isResult == false else { return }
 
        addStackView()
        calculate()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        initializeCalculator()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        initOperandLabel()
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
              currentOperand.isZero == false else {
            return
        }

        if let number = Double(currentOperand.withoutDecimalPoint) {
            let changedSignNumber = number.sign == .plus ? -number : abs(number)
            operandLabel.text = numberFormatter.string(for: changedSignNumber)
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
        calculateButton.isEnabled = false
    }
    
    private func initOperandLabel() {
        operandLabel.text = "\(initialNumber)"
    }
    
    private func initOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func initExpression() {
        inputFormula = ""
    }
    
    private func calculate() {
        var parsedExpression = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: inputFormula.withoutDecimalPoint)
        let result = parsedExpression.result()
        let formattingResult = numberFormatter.string(for: result)
        
        operandLabel.text = formattingResult
        initOperatorLabel()
        isResult = true
        calculateButton.isEnabled = false
    }
    
    private func addInputFormula(_ operandString: String?) {
        inputFormula += operatorLabel.text ?? ""
        inputFormula += operandString ?? ""
    }
    
    private func appendFormulaOrInitialize() {
        if operatorLabel.text != "" {
            isResult = false
            calculateButton.isEnabled = true
        } else {
            initializeCalculator()
        }
    }
}

// MARK: - StackView Method
extension CalculatorViewController {
    private func addStackView()  {
        let operand = operandFormatter.makeRefinementArithmeticOperand(operandLabel.text)
        let operandAsFormatterString = numberFormatter.convertToFormatterString(string: operand ?? "")
        
        addFormulaStackView(operandAsFormatterString)
        addInputFormula(operand)
        scrollToBottom()
    }
    
    private func addFormulaStackView(_ operandString: String?) {
        let arithmeticStackView = ArithmeticStackView(operatorLabel.text, operandString)
        
        calculateStackView.addArrangedSubview(arithmeticStackView)
        calculateHistoryScrollView.layoutIfNeeded()
    }
    
    private func removeStackView() {
        calculateStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: (calculateHistoryScrollView.contentSize.height - calculateHistoryScrollView.bounds.size.height))

        calculateHistoryScrollView.setContentOffset(bottomOffset, animated: true)
    }
}
