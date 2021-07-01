//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var notations: [String] = []
    var inputNotation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notations = []
    }

    func updateLabel() {
        print(inputNotation)
        print(notations)
    }
    //,  CalculatorManager.checkZeroButtonIsPressedInInitalValue(notation: inputNotation, buttonText: operandButtonNumber)
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operandButtonNumber = sender.titleLabel?.text, !CalculatorManager.checkZeroButtonIsPressedInInitalValue(notation: inputNotation, buttonText: operandButtonNumber) else {
            return
        }
        
        inputNotation = "\(inputNotation)\(operandButtonNumber)"
        updateLabel()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        // TODO - 현재 숫자입력이 없는 상태인 0에서는 연산자의 종류만 변경 처리하기.
        // TODO -  현재 숫자입력이 없는 상태인 0에서는 연산자를 반복해서 누르더라도 연산이 이뤄지지 않습니다. (ok)
        guard let operatorCase = sender.titleLabel?.text else {
            return
        }
        notations.append(inputNotation)
        notations.append(operatorCase)
        // TODO - 숫자입력 중에 연산자(÷, ×, -, +)를 누르게 되면 숫자입력을 중지하고 다음 숫자를 입력
        inputNotation = ""
        updateLabel()
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let dotButtonText = sender.titleLabel?.text,
              !CalculatorManager.hasAlreadyDot(notation: inputNotation) else {
            return
        }
        
        inputNotation = "\(CalculatorManager.pasteZeroInFrontOfDot(notation: inputNotation))\(dotButtonText)"
        
        updateLabel()
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        // TODO = 버튼을 눌러 연산을 마친 후 다시 =을 눌러도 이전 연산을 다시 연산하지 않습니다
        let calculator = Calculator()
        let result = calculator.runCalculator(on: notations)
        
        if case .success(let resultValue) = result {
            print(resultValue)
        } else if case .failure(let errorCase) = result {
            switch errorCase {
            case .dividedByZero:
                print(errorCase)
            case .stackError:
                print(errorCase)
            case .unknownError:
                print(errorCase)
            }
        }
        updateLabel()
    }
}

