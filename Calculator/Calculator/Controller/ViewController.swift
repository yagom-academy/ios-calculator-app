//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

enum Numbers: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case hundred = "00"
    case dot = "."
}

class ViewController: UIViewController {
    let calculator = Calculator()
    
    @IBOutlet weak var calculationCurentAndResultLabel: UILabel!
    
    @IBAction func touchUPInsideNumberButton(_ sender: UIButton) {
        //        calculator.numbers.append(String(sender.tag)) // TO-DO guard let
        switch sender.tag {
        case 0:
            if calculator.currentNumbers != ["0"] {
                calculator.currentNumbers.append(String(sender.tag))
            }
            print(calculator.currentNumbers)
        // TO-DO sender에 title
        case 1...9:
            if calculator.currentNumbers == ["0"] {
                calculator.currentNumbers = [String(sender.tag)]
            } else {
                calculator.currentNumbers.append(String(sender.tag))
            }
            print(calculator.currentNumbers)
        case 100:
            if calculator.currentNumbers != ["0"] {
                calculator.currentNumbers.append(Numbers.hundred.rawValue)
            }
            print(calculator.currentNumbers)
        case 101:
            if calculator.currentNumbers.contains(".") == false {
                calculator.currentNumbers.append(Numbers.dot.rawValue)
            }
            print(calculator.currentNumbers)
        default:
            break
        }
    }
    
    @IBAction func touchUpInsideDivisionButton(_ sender: UIButton) {
        calculator.numbers.append(Operator.division.rawValue)
    }
    
    @IBAction func touchUpInsideMultiplicationButton(_ sender: UIButton) {
        calculator.numbers.append(Operator.multiplication.rawValue)
    }
    
    @IBAction func touchUpInsideMinusButton(_ sender: UIButton) {
        calculator.numbers.append(Operator.minus.rawValue)
    }
    
    @IBAction func touchUpInsidePlusButton(_ sender: UIButton) {
        calculator.numbers.append(Operator.plus.rawValue)
    }
    
    @IBAction func touchUpInsideCalculateButton(_ sender: UIButton) {
        calculator.putInto(calculator.numbers)
        try? calculator.converToPostfixNotation()
        let result = try? calculator.calculatePostfix()
        print(result)
    }
    
    @IBAction func touchUpInsideAllClearButton(_ sender: UIButton) {
        let result = calculator.allClear()
        calculationCurentAndResultLabel?.text = "\(result)"
    }
    
    @IBAction func touchUpInsideClearEntryButton(_ sender: UIButton) {
        let result = calculator.clearEntry()
        calculationCurentAndResultLabel?.text = "\(result)"
    }
    
    @IBAction func touchUpInsideToggleNegativeButton(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initializedNumber = 0
        calculationCurentAndResultLabel?.text = String(initializedNumber)
    }
}

