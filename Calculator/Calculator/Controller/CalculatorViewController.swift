//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private enum NumberButton: String, CustomStringConvertible {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
        case doubleZero = "00"
        
        var description: String {
            switch self {
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
            case .seven: return "7"
            case .eight: return "8"
            case .nine: return "9"
            case .zero: return "0"
            case .doubleZero: return "00"
            }
        }
    }
    
    private enum CalculatorState {
        case on, off
    }
    
    private var isNumberInputable: Bool = true
    private var calculator = Calculator()
    
    @IBOutlet private var numberInputLabel: UILabel!
    @IBOutlet private var operatorInputLabel: UILabel!
    @IBOutlet private weak var calculationStackView: UIStackView!
    @IBOutlet private weak var calculationStackScrollView: UIScrollView!
    
    private func stateToggle(to state: CalculatorState){
        if state == .on {
            isNumberInputable = true
        } else if state == .off {
            isNumberInputable = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberInputLabel.text = "0"
        operatorInputLabel.text = ""
        for stackView in calculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
        }
    }
    
    @IBAction private func clickNumberButton(_ sender: UIButton) {
        guard let _number = sender.titleLabel?.text, let number = NumberButton.init(rawValue: _number) else { return }
        addNumberToNumberInputLabel(number: number)
    }
    
    @IBAction private func clickArithmeticButton(_ sender: UIButton) {
        guard let operation = sender.titleLabel?.text else { return }
        stateToggle(to: CalculatorState.on)
        if isInputValid() {
            try? addEntry()
        }
        operatorInputLabel.text = operation
    }
    
    @IBAction private func clickDotButton(_ sender: UIButton) {
        guard isNumberInputable else { return }
        guard let label = numberInputLabel.text else { return }
        if label.contains("."){
            if label.last == "." {
                numberInputLabel.text?.removeLast()
            }
        } else {
            numberInputLabel.text? += "."
        }
    }

    @IBAction private func clickEqualOperatorButton(_ sender: UIButton) {
        guard isNumberInputable else { return }
        do {
            try addEntry()
        } catch CalculatorError.DivideByZero {
            numberInputLabel.text = "NaN"
            operatorInputLabel.text = ""
            calculator.allClear()
            stateToggle(to: CalculatorState.off)
            return
        } catch {
            print("Unknown Error")
        }
        operatorInputLabel.text = ""
        
        do {
            numberInputLabel.text = try calculator.calculate()
        } catch CalculatorError.FailToTypeCasting {
            print("Type Casting Error")
        } catch CalculatorError.FailToPopFromCalculationStack {
            print("Stack Pop Error")
        } catch {
            print("Unknown Error")
        }
        calculator.allClear()
        stateToggle(to: CalculatorState.off)
    }
    
    @IBAction private func clickAllClearButton(_ sender: UIButton) {
        stateToggle(to: CalculatorState.on)
        numberInputLabel.text = "0"
        for stackView in calculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
        }
        calculator.allClear()
    }
    
    @IBAction private func clickClearEntryButton(_ sender: UIButton) {
        stateToggle(to: CalculatorState.on)
        numberInputLabel.text = "0"
    }
    
    @IBAction private func clickToggleSignButton(_ sender: UIButton) {
        guard isNumberInputable else { return }
        guard let inputNumber = numberInputLabel.text else { return }
        if inputNumber.first == "-" {
            numberInputLabel.text?.removeFirst()
        } else if inputNumber.first != "0" {
            numberInputLabel.text? = "-\(inputNumber)"
        }
    }
    
    private func createEntryView() -> UIView {
        var inputNumber = numberInputLabel.text
        inputNumber = inputNumber?.trimmingCharacters(in: ["."])
        let inputOperator = operatorInputLabel.text
        
        let newStackView = UIStackView()
        newStackView.axis = .horizontal
        newStackView.alignment = .trailing
        newStackView.distribution = .fill
        newStackView.spacing = 8
        
        let operatorLabel = UILabel()
        if calculationStackView.arrangedSubviews.count == 0 {
            operatorLabel.text = ""
        } else {
            operatorLabel.text = inputOperator
            operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
            operatorLabel.textColor = UIColor.white
        }
        
        let numberLabel = UILabel()
        numberLabel.text = inputNumber
        numberLabel.textColor = UIColor.white
        numberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        newStackView.addArrangedSubview(operatorLabel)
        newStackView.addArrangedSubview(numberLabel)
        
        return newStackView
    }
}

// MARK:- Calculator functions
extension CalculatorViewController {
    private func addEntry() throws {
        let inputValue = numberInputLabel.text?.components(separatedBy: ",").joined()
        guard let inputNumber = inputValue, let inputOperator = operatorInputLabel.text else { throw CalculatorError.InValidInput }
        guard (inputNumber == "0" && inputOperator == "÷") == false else{ throw CalculatorError.DivideByZero }
        calculator.enterExpression(operation: inputOperator, inputNumber: inputNumber)
        let nextEntryIndex = calculationStackView.arrangedSubviews.count
        let newEntryView = createEntryView()
        
        calculationStackView.insertArrangedSubview(newEntryView, at: nextEntryIndex )
        calculationStackScrollView.setContentOffset(CGPoint(x: 0, y: calculationStackScrollView.contentSize.height-calculationStackScrollView.bounds.height), animated: true)
        resetInputLabelsToDefault()
    }
    
    private func resetInputLabelsToDefault() {
        numberInputLabel.text = "0"
    }
    
    private func isInputValid() -> Bool {
        return numberInputLabel.text != "0"
    }

    private func addNumberToNumberInputLabel(number: NumberButton) {
        guard isNumberInputable else { return }
        
        let maxLength = 20
        guard var numberValue = numberInputLabel.text else { return }
        let numberLength = numberValue.components(separatedBy: ",").joined().count
        guard numberLength < maxLength else { return }
        if numberValue == "0" {
            if number != .doubleZero {
                numberValue = "\(number)"
            }
        } else {
            if numberLength == maxLength - 1 && number == .doubleZero { return }
            numberValue += "\(number)"
        }
        numberValue = numberValue.components(separatedBy: ",").joined()
        guard let doubleType = Double(numberValue) else { return }
        
        numberInputLabel.text? = doubleType.fractionDigits()
    }
}
