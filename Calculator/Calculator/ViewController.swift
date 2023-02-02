//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var operatorInput: UILabel!
    @IBOutlet weak private var numberInput: UILabel!
    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet weak private var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var isFinishedCalculating: Bool = false
    private var isEnteredOperand: Bool = false
    private var isChangeableOperator: Bool = false
    private var numberFormatter = NumberFormatter()
    
    private var currentNumber: String = "0" {
        didSet {
            numberInput.text = applyDecimalPoint(number: currentNumber)
        }
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
        
        currentNumber = "0"
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        if currentNumber == "0"  {
            currentNumber = number
        } else {
            currentNumber += number
        }
    }
    
    @IBAction func changeSignButtonTapped(_ sender: UIButton) {
        checkSign()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        
        if isFinishedCalculating {
            numberInput.text = "0"
        } else {
            numberInput.text = ""
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
        
        if !stackView.subviews.isEmpty && numberInput.text == "0" {
            isChangeableOperator = true
        } else {
            isChangeableOperator = false
        }
    }
    
    private func checkInitialCondition() {
        
        if numberInput.text == "0" {
            isEnteredOperand = false
        } else {
            isEnteredOperand = true
        }
    }
    
    private func addStackView() {
        
        guard let operandStackLabel = numberInput.text,
              let operatorStackLabel = operatorInput.text else {  return  }
        
        let stackLabel = UILabel()
        stackLabel.text = operatorStackLabel + " " + operandStackLabel
        stackLabel.numberOfLines = 0
        stackLabel.adjustsFontForContentSizeCategory = true
        stackLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackLabel.textColor = .white
        stackView.addArrangedSubview(stackLabel)
        setScrollView()
        
    }
    
    private func setScrollView() {
        let bottomOffset: CGPoint = CGPointMake(0, scrollView.contentSize.height)
        scrollView.setContentOffset(bottomOffset, animated: false)
    }
    
    private func applyDecimalPoint(number: String) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        guard let operand = Double(number) else { return "" }
        guard let result = numberFormatter.string(from: NSNumber(value: operand)) else { return "" }
        
        return result
    }
    
    private func checkSign() {
        
        guard var currentNumber = numberInput.text,
              currentNumber != "0" else { return }
        
        if let minus = currentNumber.firstIndex(of: "-") {
            currentNumber.remove(at: minus)
            numberInput.text = currentNumber
        } else {
            numberInput.text = "-" + currentNumber
        }
    }
    
    private func resetStackView() {
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func resetNumberInput() {
        currentNumber = "0"
    }
    
    private func resetOperatorInput() {
        operatorInput.text = " "
    }
    
    private func handleDivideError() {
        
        do {
            let resultLabel = try checkDecimalPoint()
            numberInput.text = resultLabel
            isFinishedCalculating = true
        } catch CalculatorError.divideByZero {
            numberInput.text = "NaN"
        } catch {
            print("계산오류")
        }
    }
    
    private func checkDecimalPoint() throws -> String {
        
        let resultLabel: String = calculate()
        let dividedValue = resultLabel.components(separatedBy: ".")
        guard !dividedValue[0].isEmpty || dividedValue[1] == "0" else {
            throw CalculatorError.calcuate
        }
        numberFormatter.minimumFractionDigits = 0
        guard let number = Double(resultLabel) else { return "" }
        guard let formatterNumber = numberFormatter.string(from: NSNumber(value: number)) else { return "" }
        return formatterNumber
    }
    
    private func calculate() -> String {
        
        let calculateItem = arrangeCalculateItems()
        var formula = ExpressionParser.parse(from: calculateItem)
        let result = formula.result()
        guard let resultValue = result else { return "" }
        let resultLabel = String(resultValue)
        return resultLabel
    }
    
    private func arrangeCalculateItems() -> String {
        
        addStackView()
        var calculateItems: [String] = []
        stackView.arrangedSubviews.forEach { view in
            if let label = view as? UILabel {
                guard let value = label.text else { return }
                calculateItems.append(value)
            }
        }
        return calculateItems.map { $0.components(separatedBy: ",").joined() }
            .map {$0.components(separatedBy: " ").joined() }.joined(separator: "")
    }
    
}
