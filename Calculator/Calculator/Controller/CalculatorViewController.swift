//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    enum NumberButton: CustomStringConvertible {
        case one, two, three, four, five, six, seven,
             eight, nine, zero, doubleZero
        
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
    var calculator = Calculator()
    
    @IBOutlet var numberInputLabel: UILabel!
    @IBOutlet var operatorInputLabel: UILabel!
    @IBOutlet weak var CalculationStackView: UIStackView!
    @IBOutlet weak var CalculationStackScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberInputLabel.text = "0"
        operatorInputLabel.text = ""
        
        for stackView in CalculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
        }
    }
    
    @IBAction func clickNumberOneButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .one)
    }
    @IBAction func clickNumberTwoButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .two)
    }
    @IBAction func clickNumberThreeButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .three)
    }
    @IBAction func clickNumberFourButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .four)
    }
    @IBAction func clickNumberFiveButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .five)
    }
    @IBAction func clickNumberSixButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .six)
    }
    @IBAction func clickNumberSevenButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .seven)
    }
    @IBAction func clickNumberEightButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .eight)
    }
    @IBAction func clickNumberNineButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .nine)
    }
    @IBAction func clickNumberZeroButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .zero)
    }
    @IBAction func clickNumberDoubleZeroButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .doubleZero)
    }
    @IBAction func clickDotButton(_ sender: UIButton) {
        guard let label = numberInputLabel.text else { return }
        if label.contains("."){
            if label.last == "." {
                numberInputLabel.text?.removeLast()
            }
        } else {
            numberInputLabel.text? += "."
        }
    }
    
    @IBAction func clickPlusOperatorButton(_ sender: UIButton) {
        if isInputValid() {
            try? addEntry()
        }
        operatorInputLabel.text = "+"
    }
    @IBAction func clickMinusOperatorButton(_ sender: UIButton) {
        if isInputValid() {
            try? addEntry()
        }
        operatorInputLabel.text = "-"
    }
    @IBAction func clickMultiplyOperatorButton(_ sender: UIButton) {
        if isInputValid() {
            try? addEntry()
        }
        operatorInputLabel.text = "×"
    }
    @IBAction func clickDivideOperatorButton(_ sender: UIButton) {
        if isInputValid() {
            try? addEntry()
        }
        operatorInputLabel.text = "÷"
    }
    @IBAction func clickEqualOperatorButton(_ sender: UIButton) {
        do {
            try addEntry()
        } catch CalculatorError.DivideByZero {
            numberInputLabel.text = "NaN"
            operatorInputLabel.text = ""
            calculator.allClear()
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
    }
    
    @IBAction func clickAllClearButton(_ sender: UIButton) {
        numberInputLabel.text = "0"
        for stackView in CalculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
        }
        calculator.allClear()
    }
    
    @IBAction func clickClearEntryButton(_ sender: UIButton) {
        numberInputLabel.text = "0"
    }
    
    @IBAction func clickToggleSignButton(_ sender: UIButton) {
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
        if CalculationStackView.arrangedSubviews.count == 0 {
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
        let nextEntryIndex = CalculationStackView.arrangedSubviews.count
        let newEntryView = createEntryView()
        
        CalculationStackView.insertArrangedSubview(newEntryView, at: nextEntryIndex )
        CalculationStackScrollView.setContentOffset(CGPoint(x: 0, y: CalculationStackScrollView.contentSize.height-CalculationStackScrollView.bounds.height), animated: true)
        resetInputLabelsToDefault()
    }
    
    private func resetInputLabelsToDefault() {
        numberInputLabel.text = "0"
    }
    
    private func isInputValid() -> Bool {
        return numberInputLabel.text != "0"
    }

    func addNumberToNumberInputLabel(number: NumberButton) {
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
