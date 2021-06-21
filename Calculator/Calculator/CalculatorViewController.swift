//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var numberInputLabel: UILabel!
    @IBOutlet var operatorInputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
    
    // depth 고민
    func addNumberToNumberInputLabel(number: NumberButton) {
        if numberInputLabel.text == "0" {
            if number != .doubleZero {
                numberInputLabel.text? = "\(number)"
            }
        } else {
            numberInputLabel.text? += "\(number)"
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
    }
    
    // Operator
    @IBAction func clickPlusOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "+"
    }
    @IBAction func clickMinusOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "-"
    }
    @IBAction func clickMultiplyOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "x"
    }
    @IBAction func clickDivideOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "÷"
    }
    @IBAction func clickEqualOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func clickAllClearButton(_ sender: UIButton) {
        numberInputLabel.text = "0"
    }
    @IBAction func clickClearEntryButton(_ sender: UIButton) {
    }
    @IBAction func clickToggleSignButton(_ sender: UIButton) {
    }
    
}

