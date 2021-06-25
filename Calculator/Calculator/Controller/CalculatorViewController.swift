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
    }
    
    private func createEntryView() -> UIView {
        let inputNumber = numberInputLabel.text
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
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberInputLabel.text = "0"
        operatorInputLabel.text = ""
        
        for stackView in CalculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
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
    }
    
    @IBAction func clickAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func clickClearEntryButton(_ sender: UIButton) {
    }
    
    @IBAction func clickToggleSignButton(_ sender: UIButton) {
    }
}
// MARK:- Calculator functions
extension CalculatorViewController {
    private func addEntry() throws {
        guard let inputNumber = numberInputLabel.text, let inputOperator = operatorInputLabel.text else { throw CalculatorError.InValidInput }
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
        if numberInputLabel.text == "0" {
            if number != .doubleZero {
                numberInputLabel.text? = "\(number)"
            }
        } else {
            numberInputLabel.text? += "\(number)"
        }
    }
}
