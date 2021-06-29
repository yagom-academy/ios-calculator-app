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
        case 0...9:
            calculator.numbers.append(String(sender.tag)) // TO-DO sender에 title
//        case 1:
//            calculator.numbers.append(Numbers.one.rawValue)
//        case 2:
//            calculator.numbers.append(Numbers.two.rawValue)
//        case 3:
//            calculator.numbers.append(Numbers.three.rawValue)
//        case 4:
//            calculator.numbers.append(Numbers.four.rawValue)
//        case 5:
//            calculator.numbers.append(Numbers.five.rawValue)
//        case 6:
//            calculator.numbers.append(Numbers.six.rawValue)
//        case 7:
//            calculator.numbers.append(Numbers.seven.rawValue)
//        case 8:
//            calculator.numbers.append(Numbers.eight.rawValue)
//        case 9:
//            calculator.numbers.append(Numbers.nine.rawValue)
        case 100:
            calculator.numbers.append(Numbers.hundred.rawValue)
        case 101:
            calculator.numbers.append(Numbers.dot.rawValue)
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
        //테스트 함수 실행을 위한 호출
//        main()
    }
}

