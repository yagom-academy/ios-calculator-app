//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet weak private var operatorInput: UILabel!
    @IBOutlet weak private var numberInput: UILabel!
    @IBOutlet weak private var calculatorItemsStackView: UIStackView!
    @IBOutlet weak private var calculatorItemsScrollView: UIScrollView!
    
    private var isFinishedCalculating: Bool = false
    private var isEnteredOperand: Bool = false
    private var isChangeableOperator: Bool = false
    private var numberFormatter = NumberFormatter()
    private var currentNumber: String = Expression.zero {
        didSet {
            numberInput.text = applyDecimalPoint(number: currentNumber)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let senderSign = sender.currentTitle else { return }
        checkInitialCondition()
        operandIsZero()
        if isEnteredOperand == true  {
            addStackView()
            operatorInput.text = senderSign
        }
        
        if isChangeableOperator == true {
            operatorInput.text = senderSign
        }
        
        currentNumber = Expression.zero
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        if currentNumber == Expression.zero  {
            currentNumber = number
        } else {
            currentNumber += number
        }
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        
        guard let dot = sender.currentTitle else { return }
        guard !currentNumber.contains(Expression.dot) else { return }
        currentNumber += dot
    }
    
    @IBAction func changeSignButtonTapped(_ sender: UIButton) {
        checkSign()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        
        if isFinishedCalculating {
            numberInput.text = Expression.zero
        } else {
            numberInput.text = Expression.empty
        }
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        
        resetStackView()
        resetNumberInput()
        resetOperatorInput()
        isFinishedCalculating = false
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        if isFinishedCalculating == false {
            handleDivideError()
        }
    }
    
    private func operandIsZero() {
        
        if !calculatorItemsStackView.subviews.isEmpty && numberInput.text == Expression.zero {
            isChangeableOperator = true
        } else {
            isChangeableOperator = false
        }
    }
    
    private func checkInitialCondition() {
        
        if numberInput.text == Expression.zero {
            isEnteredOperand = false
        } else {
            isEnteredOperand = true
        }
    }
    
    private func addStackView() {
        
        guard let operandStackLabel = numberInput.text,
              let operatorStackLabel = operatorInput.text else {  return  }
        
        let stackLabel = UILabel()
        stackLabel.text = operatorStackLabel + Expression.blank + operandStackLabel
        stackLabel.numberOfLines = 0
        stackLabel.adjustsFontForContentSizeCategory = true
        stackLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackLabel.textColor = .white
        calculatorItemsStackView.addArrangedSubview(stackLabel)
        setScrollView()
        
    }
    
    private func setScrollView() {
        let bottomOffset: CGPoint = CGPointMake(0, calculatorItemsScrollView.contentSize.height)
        calculatorItemsScrollView.setContentOffset(bottomOffset, animated: false)
    }
    
    private func applyDecimalPoint(number: String) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        guard let operand = Double(number) else { return Expression.empty }
        guard let result = numberFormatter.string(from: NSNumber(value: operand)) else { return "" }
        
        return result
    }
    
    private func checkSign() {
        
        guard var currentNumber = numberInput.text,
              currentNumber != Expression.zero else { return }
        
        if let minus = currentNumber.firstIndex(of: Character(Expression.minus)) {
            currentNumber.remove(at: minus)
            numberInput.text = currentNumber
        } else {
            numberInput.text = Expression.minus + currentNumber
        }
    }
    
    private func resetStackView() {
        calculatorItemsStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func resetNumberInput() {
        currentNumber = Expression.zero
    }
    
    private func resetOperatorInput() {
        operatorInput.text = Expression.blank
    }
    
    private func handleDivideError() {
        
        do {
            let resultLabel = try checkDecimalPoint()
            numberInput.text = resultLabel
            isFinishedCalculating = true
        } catch CalculatorError.divideByZero {
            numberInput.text = Expression.nan
        } catch {
            print("계산오류")
        }
    }
    
    private func checkDecimalPoint() throws -> String {
        
        let resultLabel: String = calculate()
        let dividedValue = resultLabel.components(separatedBy: Expression.dot)
        guard !dividedValue[0].isEmpty || dividedValue[1] == Expression.zero else {
            throw CalculatorError.calcuate
        }
        numberFormatter.minimumFractionDigits = 0
        guard let number = Double(resultLabel) else { return Expression.empty }
        guard let formatterNumber = numberFormatter.string(from: NSNumber(value: number)) else { return Expression.empty }
        return formatterNumber
    }
    
    private func calculate() -> String {
        
        let calculateItem = arrangeCalculateItems()
        var formula = ExpressionParser.parse(from: calculateItem)
        let result = formula.result()
        guard let resultValue = result else { return Expression.empty }
        let resultLabel = String(resultValue)
        return resultLabel
    }
    
    private func arrangeCalculateItems() -> String {
        
        addStackView()
        var calculateItems: [String] = []
        calculatorItemsStackView.arrangedSubviews.forEach { view in
            if let label = view as? UILabel {
                guard let value = label.text else { return }
                calculateItems.append(value)
            }
        }
        return calculateItems.map { $0.components(separatedBy: Expression.comma).joined() }
            .map {$0.components(separatedBy: Expression.blank).joined() }.joined(separator: Expression.empty)
    }
    
}
