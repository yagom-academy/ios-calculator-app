//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let calculator: Calculatorable = Calculator()
    var inputStorage: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateChangableOperator(with: String) {
        guard let lastElement = inputStorage.last,
              let lastType = try? CalculatorComponent.convertToComponentType(from: lastElement),
              lastType == .operator else {
            inputStorage.append(with)
            return
        }
        
        guard with == lastElement else {
            let lastIndex = inputStorage.count-1
            inputStorage[lastIndex] = with
            return
        }
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        inputStorage.append("0")
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        inputStorage.append("00")
    }
    
    @IBAction func touchUpOneButton(_ sender: UIButton) {
        inputStorage.append("1")
    }
    
    @IBAction func touchUpTwoButton(_ sender: UIButton) {
        inputStorage.append("2")
    }
    
    @IBAction func touchUpThreeButton(_ sender: UIButton) {
        inputStorage.append("3")
    }
    
    @IBAction func touchUpFourButton(_ sender: UIButton) {
        inputStorage.append("4")
    }
    
    @IBAction func touchUpFiveButton(_ sender: UIButton) {
        inputStorage.append("5")
    }
    
    @IBAction func touchUpSixButton(_ sender: UIButton) {
        inputStorage.append("6")
    }
    
    @IBAction func touchUpSevenButton(_ sender: UIButton) {
        inputStorage.append("7")
    }
    
    @IBAction func touchUpEightButton(_ sender: UIButton) {
        inputStorage.append("8")
    }
    
    @IBAction func touchUpNineButton(_ sender: UIButton) {
        inputStorage.append("9")
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        inputStorage.append(".")
    }
    
    @IBAction func touchUpDivideButton(_ sender: UIButton) {
        updateChangableOperator(with: "/")
    }
    
    @IBAction func touchUpMultiplyButton(_ sender: UIButton) {
        updateChangableOperator(with: "*")
    }
    
    @IBAction func touchUpMinusButton(_ sender: UIButton) {
        updateChangableOperator(with: "-")
    }
    
    @IBAction func touchUpPlusButton(_ sender: UIButton) {
        updateChangableOperator(with: "+")
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        let postfix = calculator.convertToPostfixExpression(fromInfix: inputStorage)
        if let result = try? String(calculator.calculatePostfixExpression(postfix: postfix)) {
            print(result)
        } else {
            print("NaN")
        }
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        inputStorage.removeAll()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        // =,숫자일때 해야할 내용
    }
    
    @IBAction func touchUpConvertSignButton(_ sender: UIButton) {
        inputStorage.append("⁺⁄₋")
    }
    
}

