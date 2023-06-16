//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

enum NumberConstraints {
    static var initialNumber: Int { return 0 }
    static var maximumFractionDigits: Int { return 5 }
    static var maximumOperandDigits: Int { return 20 }
}

final class CalculatorViewController: UIViewController {
    private var inputFormula = String()
    private var numberFormatter = NumberFormatter()
    private lazy var operandFormatter = OperandFormatter(numberFormatter)
    private var isResult = false
    private var isFirstArithmeticFormula: Bool {
        return calculateStackView.subviews.isEmpty
    }
    
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var calculateHistoryScrollView: UIScrollView!
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = NumberConstraints.maximumFractionDigits
        equalButton.isEnabled = false
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let inputedOperand = sender.currentTitle,
              var currentOperand = operandLabel.text?.withoutDecimalPoint else { return }
        
        if isResult {
            setFormulaAppendOrReset()
            currentOperand = "\(NumberConstraints.initialNumber)"
        }
        
        guard let operandLabelText = operandFormatter.setUpInputOperandText(currentOperand, inputedOperand) else { return }
        
        operandLabel.text = operandLabelText
    }

    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text?.isZero == false else {
            operatorLabel.text = isFirstArithmeticFormula ? "" : sender.currentTitle
            return
        }
        
        if isResult == true { resetExpression() }
        
        addStackView()
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "\(NumberConstraints.initialNumber)"
        setUpHaveResultOption(false)
    }
        
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        guard isResult == false else { return }
 
        addStackView()
        calculate()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        resetOperandLabel()
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
    private func resetCalculator() {
        resetExpression()
        resetOperandLabel()
        resetOperatorLabel()
        removeArithmeticStackViews()
        isResult = false
        equalButton.isEnabled = false
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "\(NumberConstraints.initialNumber)"
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetExpression() {
        inputFormula = ""
    }
    
    
    
    private func calculate() {
        var parsedExpression = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: inputFormula.withoutDecimalPoint)
        let result = parsedExpression.result()
        let formattingResult = numberFormatter.string(for: result)
        
        operandLabel.text = formattingResult
        resetOperatorLabel()
        setUpHaveResultOption(true)
    }
    
    private func addInputFormula(_ operandString: String?) {
        inputFormula += operatorLabel.text ?? ""
        inputFormula += operandString ?? ""
    }
    
    private func setFormulaAppendOrReset() {
        if operatorLabel.text != "" {
            setUpHaveResultOption(false)
        } else {
            resetCalculator()
        }
    }
    
    private func setUpHaveResultOption(_ haveResult: Bool) {
        isResult = haveResult
        equalButton.isEnabled = !haveResult
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
    
    private func removeArithmeticStackViews() {
        calculateStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: (calculateHistoryScrollView.contentSize.height - calculateHistoryScrollView.bounds.size.height))

        calculateHistoryScrollView.setContentOffset(bottomOffset, animated: true)
    }
}
