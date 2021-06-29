//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
	
	private let calculator: Calculatorable = Calculator()
	private let zero = "0"
	private var inputStorage: [String] = []
		
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	private func updateChangableOperator(with: String) {
		guard let lastElement = inputStorage.last else {
			inputStorage.append(zero)
			inputStorage.append(with)
			return
		}
		
		if let lastType = try? CalculatorComponent.convertToComponentType(from: lastElement) {
			if lastType == .operator && with != lastElement {
				let lastIndex = inputStorage.count-1
				inputStorage[lastIndex] = with
			} else if lastType == .number {
				inputStorage.append(with)
			}
		}
	}
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        inputStorage.append("\(sender.tag)")
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        inputStorage.append("00")
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
        guard let infix = try? calculator.makeInfixExpression(from: inputStorage) else {
            return
        }
        
		let postfix = calculator.convertToPostfixExpression(fromInfix: infix)
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
		guard let lastValue = inputStorage.last,
			  let lastType = try? CalculatorComponent.convertToComponentType(from: lastValue),
			  lastType != .operator else {
			return
		}
		
		if lastType == .equalSign {
			inputStorage.removeAll()
		} else if lastType == .number {
			inputStorage.popLast()
		}
	}
	
	@IBAction func touchUpConvertSignButton(_ sender: UIButton) {
		
		inputStorage.append("⁺⁄₋")
	}
	
}

