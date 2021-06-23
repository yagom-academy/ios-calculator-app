//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
	
	let calculator = Calculator()
	var inputStorage: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func updateChangableOperator(with: String) {
		guard let currentElementType = try? calculator.convertToComponentType(from: with),
			  let lastElement = inputStorage.last,
			  let lastElementType = try? calculator.convertToComponentType(from: lastElement),
			  lastElementType == currentElementType else {
			
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
		print(inputStorage)
		var postfix = [String]()
		var numberString = ""
		var stack = Stack()
		print("?")
		for currentElement in inputStorage {
			let currentType = try? calculator.convertToComponentType(from: currentElement)
			
			if currentType == .number {
				numberString += currentElement
			} else {
				postfix.append(numberString)
				numberString = ""
				
				if let checkedElement = stack.peek(),
				   let lastElement = stack.pop() {
					if ["*", "/"].contains(lastElement) {
						postfix.append(lastElement)
						stack.push(element: currentElement)
					} else {
						if ["+", "-"].contains(currentElement) {
							postfix.append(lastElement)
							stack.push(element: currentElement)
						} else {
							stack.push(element: currentElement)
						}
					}
				} else {
					stack.push(element: currentElement)
				}
			}
		}
		print("?")
		
		while stack.peek() != nil {
			if let element = stack.pop() {
				postfix.append(element)
			}
		}
		print("?")
		print(postfix)
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

