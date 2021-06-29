//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Do Yi Lee on 2021/06/29.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

	let sut: Calculatorable = Calculator()
	
	func test_test() {
		XCTAssertEqual(5, Int(5.7))
	}
	
	func test_1더하기2더하기3등호를입력하면_6이나온다() {
		let input = ["1", "+", "2", "+", "3"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result!, "6")
	}

}
