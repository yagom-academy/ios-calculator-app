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
	private var numberString = ""
		
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
				inputStorage.append(numberString)
				inputStorage.append(with)
				numberString = ""
			}
		}
	}
	
	@IBAction func touchUpZeroButton(_ sender: UIButton) {
		numberString += "0"
	}
	
	@IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
		numberString += "00"
	}
	
	@IBAction func touchUpOneButton(_ sender: UIButton) {
		numberString += "1"
	}
	
	@IBAction func touchUpTwoButton(_ sender: UIButton) {
		numberString += "2"
	}
	
	@IBAction func touchUpThreeButton(_ sender: UIButton) {
		numberString += "3"
	}
	
	@IBAction func touchUpFourButton(_ sender: UIButton) {
		numberString += "4"
	}
	
	@IBAction func touchUpFiveButton(_ sender: UIButton) {
		numberString += "5"
	}
	
	@IBAction func touchUpSixButton(_ sender: UIButton) {
		numberString += "6"
	}
	
	@IBAction func touchUpSevenButton(_ sender: UIButton) {
		numberString += "7"
	}
	
	@IBAction func touchUpEightButton(_ sender: UIButton) {
		numberString += "8"
	}
	
	@IBAction func touchUpNineButton(_ sender: UIButton) {
		numberString += "9"
	}
	
	@IBAction func touchUpDotButton(_ sender: UIButton) {
		numberString += "."
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
		// 1. 분기처리하기
		// 2. 버튼을 누르면 * -1 를 넣기 ->
		
		inputStorage.append("⁺⁄₋")
	}
	
}

