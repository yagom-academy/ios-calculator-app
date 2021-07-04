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
	
	func test_1더하기2더하기3등호를입력하면_6이나온다() {
		let input = ["1", "+", "2", "+", "3"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "6")
	}

	func test_1곱하기2곱하기3등호를입력하면_6이나온다() {
		let input = ["1", "*", "2", "*", "3"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "6")
	}

	func test_1빼기2빼기3등호를입력하면_마이너스4가나온다() {
		let input = ["1", "-", "2", "-", "3"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "-4")
	}

	func test_1나누기2등호를입력하면_영점오가나온다() {
		let input = ["1", "/", "2"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "0.5")
	}

	func test_1곱하기3더하기2나누기2등호를입력하면_4가나온다() {
		let input = ["1", "*", "3", "+","2", "/", "2"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "4")
	}

	func test_1곱하기3더하기2나누기0등호를입력하면_NaN이나온다() {
		let input = ["1", "*", "3", "+","2", "/", "0"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "NaN")
	}

	func test_10점1더하기12점5나누기125더하기8빼기100곱하기13점8등호를입력하면_마이너스1361점8이나온다() {
		let input = ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]
		let result = sut.calculate(input: input)
		XCTAssertEqual(result, "-1361.8")
	}
	
}
