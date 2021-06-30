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
    
    func inputOperator(_ currentOperator: String) {
        var isAvailableAddingOperator = false
        //userInput은 ["0"]
        //currentOperator = "-"
        //처음 아이템은 .plus
        //처음의 inputLast는 "0"
        
        //userInput은 ["0", ""]
        //currentOperator = "-"
        //처음 아이템은 .plus
        //처음의 inputLast는 "0"
        for item in Operator.allCases {
            if let inputLast =  calculator.userInput.last, inputLast != item.rawValue {
                isAvailableAddingOperator = true
            }
            if item.rawValue.contains(userInfputLast) == false {
                calculator.userInput.removeLast()
                calculator.userInput.append(calculator.concatNumbers())
                calculator.currentNumbers = calculator.initializedNumber
                calculator.userInput.append(currentOperator)
                print(calculator.userInput)
            } else {
                calculator.userInput.removeLast()
                calculator.userInput.append(currentOperator)
            }
        }
    }
    
    @IBOutlet weak var calculationCurentAndResultLabel: UILabel!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
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
    
    @IBAction func touchUpInsideOperatorButton(_ sender: UIButton) {
        switch sender {
        case plusButton:
            inputOperator(Operator.plus.rawValue)
        case minusButton:
            inputOperator(Operator.minus.rawValue)
        case multiplicationButton:
            inputOperator(Operator.multiplication.rawValue)
        case divisionButton:
            inputOperator(Operator.division.rawValue)
        default: break
        }
    }
    
//    @IBAction func touchUpInsideMultiplicationButton(_ sender: UIButton) {
//        for item in Operator.allCases {
//            guard let userInfputLast = calculator.userInput.last else { return }
//            if item.rawValue.contains(userInfputLast) == false {
//                calculator.userInput.append(calculator.concatNumbers())
//                calculator.currentNumbers = calculator.initializedNumber
//                calculator.userInput.append(Operator.division.rawValue)
//                print(calculator.userInput)
//            } else {
//                calculator.userInput.removeLast()
//                calculator.userInput.append(Operator.division.rawValue)
//            }
//        }
//    }
//
//    @IBAction func touchUpInsideMinusButton(_ sender: UIButton) {
//        for item in Operator.allCases {
//            guard let userInfputLast = calculator.userInput.last else { return }
//            if item.rawValue.contains(userInfputLast) == false {
//                calculator.userInput.append(calculator.concatNumbers())
//                calculator.currentNumbers = calculator.initializedNumber
//                calculator.userInput.append(Operator.division.rawValue)
//                print(calculator.userInput)
//            } else {
//                calculator.userInput.removeLast()
//                calculator.userInput.append(Operator.division.rawValue)
//            }
//        }
//    }
//
//    @IBAction func touchUpInsidePlusButton(_ sender: UIButton) {
//        for item in Operator.allCases {
//            guard let userInfputLast = calculator.userInput.last else { return }
//            if item.rawValue.contains(userInfputLast) == false {
//                calculator.userInput.append(calculator.concatNumbers())
//                calculator.currentNumbers = calculator.initializedNumber
//                calculator.userInput.append(Operator.division.rawValue)
//                print(calculator.userInput)
//            } else {
//                calculator.userInput.removeLast()
//                calculator.userInput.append(Operator.division.rawValue)
//            }
//        }
//    }
    
    @IBAction func touchUpInsideCalculateButton(_ sender: UIButton) {
        calculator.putInto(calculator.userInput)
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

