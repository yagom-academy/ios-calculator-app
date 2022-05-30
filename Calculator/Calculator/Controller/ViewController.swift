//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Foundation

final class ViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var calculatorValue = CalculatorValue()
    
    // MARK: - NotificationCenter
    let center = NotificationCenter.default
    
    @objc
    func updateView(notification: NSNotification) {
        guard let object = notification.object as? String else {
            return
        }
        
        switch notification.name {
        case NSNotification.Name(rawValue: "operand"):
            inputNumberLabel.text = object
        case NSNotification.Name(rawValue: "operator"):
            inputOperatorLabel.text = object
        case NSNotification.Name(rawValue: "arithmetic"):
            if object == "" {
                stackView.removeAllArrangedSubview()
            } else {
                stackView.addLable(arithmetic: object)
                scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height + 20), animated: false)
            }
        default:
            return
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorValue.resetCalculator()
        calculatorValue.resetInput(inputNumber: true, inputOperator: true)
        
        center.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "operand"), object: nil)
        center.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "operator"), object: nil)
        center.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "arithmetic"), object: nil)
    }
}

extension ViewController {
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        stackView.removeAllArrangedSubview()
        calculatorValue.resetCalculator()
        calculatorValue.resetInput(inputNumber: true, inputOperator: true)
    }
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        calculatorValue.resetInput(inputNumber: true, inputOperator: false)
    }
    
    private func updateStackView() {
        if calculatorValue.isNumberEmpty {
            return
        }
        
        calculatorValue.appendArithmetic()
        calculatorValue.resetInput(inputNumber: true, inputOperator: true)
    }
}

// TODO : View + value
extension ViewController {
    @IBAction private func tapKeypadButton(_ sender: UIButton) {
        let tappedNumber = sender.titleLabel?.text ?? "0"
        calculatorValue.updateInputNumber(with: tappedNumber)
    }
    
    @IBAction private func tapOperatorsButton(_ sender: UIButton) {
        var currentOperator: Character = " "
        switch sender {
        case additionButton:
            currentOperator = Operator.add.symbol
        case subtractionButton:
            currentOperator = Operator.subtract.symbol
        case multiplicationButton:
            currentOperator = Operator.multiply.symbol
        case divisionButton:
            currentOperator = Operator.divide.symbol
        default:
            return
        }
        
        updateStackView()
        calculatorValue.updateOperatorInput(operator: String(currentOperator))
    }
    
    @IBAction private func tapResultButton() {
        if calculatorValue.isArithmeticEmpty {
            return
        }
        
        updateStackView()
        
        let formula = ExpressionParser.parse(from: calculatorValue.arithmetic)
        var result = 0.0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        do {
            result = try formula.result()
            calculatorValue.updateInputNumber(with: numberFormatter.string(from: NSNumber(value: result)) ?? "0")
        } catch CalculatorError.dividedByZero {
            calculatorValue.updateInputNumber(with: CalculatorError.dividedByZero.errorMessage)
        } catch {
            calculatorValue.updateInputNumber(with: CalculatorError.unknownError.errorMessage)
        }
        
        calculatorValue.resetCalculator()
        calculatorValue.resetInput(inputNumber: false, inputOperator: true)
    }
    
    @IBAction private func tapToChangeSignButton(_ sender: UIButton) {
        calculatorValue.convertSign()
    }
}
