//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © Sanchez, Hosinging, Soll. All rights reserved.
// 

import UIKit

// MARK: - Enumerations 타입 정의
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
    
    //MARK: - IBOutlet
    @IBOutlet weak var calculationCurentAndResultLabel: UILabel!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    //MARK: - Property
    let calculator = Calculator()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let initializedNumber = 0
        calculationCurentAndResultLabel?.text = String(initializedNumber)
    }
    
    //MARK: - IBAction
    @IBAction func touchUPInsideNumberButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if calculator.currentNumbers != ["0"] {
                calculator.currentNumbers.append(String(sender.tag))
                calculator.currentOperatorCheck = "0"
            }
            print(calculator.currentNumbers)
        case 1...9:
            if calculator.currentNumbers == ["0"] {
                calculator.currentNumbers = [String(sender.tag)]
            } else {
                calculator.currentNumbers.append(String(sender.tag))
            }
            calculator.currentOperatorCheck = "0"
            print(calculator.currentNumbers)
        case 100:
            if calculator.currentNumbers != ["0"] {
                calculator.currentNumbers.append(Numbers.hundred.rawValue)
                calculator.currentOperatorCheck = "0"
            }
            print(calculator.currentNumbers)
        case 101:
            if calculator.currentNumbers.contains(".") == false {
                calculator.currentNumbers.append(Numbers.dot.rawValue)
                calculator.currentOperatorCheck = "0"
            }
            print(calculator.currentNumbers)
        default:
            break
        }
    }
    
    @IBAction func touchUpInsideOperatorButton(_ sender: UIButton) {
        switch sender {
        case plusButton:
            calculator.inputOperator(Operator.plus.rawValue)
        case minusButton:
            calculator.inputOperator(Operator.minus.rawValue)
        case multiplicationButton:
            calculator.inputOperator(Operator.multiplication.rawValue)
        case divisionButton:
            calculator.inputOperator(Operator.division.rawValue)
        default: break
        }
    }
    
    @IBAction func touchUpInsideCalculateButton(_ sender: UIButton) {
        calculator.putInto(calculator.userInput)
        let _ = try? calculator.converToPostfixNotation()
        guard let result = try? calculator.calculatePostfix() else { return }
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
}

