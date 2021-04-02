//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//

import XCTest

class DecimalCalculatorTests: XCTestCase {
    private var sut: DecimalCalculator?
    
    override func setUpWithError() throws {
        sut = DecimalCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_add() {
        let positiveResult = sut?.add(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(positiveResult, 300)
        
        let negativeResult = sut?.add(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(negativeResult, -100)
        
        let resultOver9Digits = sut?.add(firstNumber: 900000000, secondNumber: 200000000)
        XCTAssertEqual(resultOver9Digits, 1100000000)
        
        let addZero = sut?.add(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(addZero, 100)
        
        let addDecimalNumber = sut?.add(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(addDecimalNumber, 444.444)
        
        let negativeDecimalResult = sut?.add(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(negativeDecimalResult, -1.3)
        
        let decimalsOutOfRange = sut?.add(firstNumber: 10000000.123456789, secondNumber: 99999999.989898989)
        XCTAssertEqual(decimalsOutOfRange, 110000000.11335579)
    }
    
    func test_subtract() {
        let negativeResult = sut?.subtract(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(negativeResult, -100)
        
        let positiveResult = sut?.subtract(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(positiveResult, 300)
        
        let resultOver9Digits = sut?.subtract(firstNumber: 1300000000, secondNumber: 200000000)
        XCTAssertEqual(resultOver9Digits, 1100000000)

        let subtractZero = sut?.subtract(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(subtractZero, 100)
        
        let negativeDecimalResult = sut?.subtract(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(negativeDecimalResult, -198.198)
        
        let positiveDecimalResult = sut?.subtract(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(positiveDecimalResult, 22.3)
        
        let decimalsOutOfRange = sut?.subtract(firstNumber: 10000000.123456789, secondNumber: 99999999.989898989)
        XCTAssertEqual(decimalsOutOfRange, -89999999.8664422)
    }

    func test_multiply() {
        let positiveResult = sut?.multiply(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(positiveResult, 20000)
        
        let negativeResult = sut?.multiply(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(negativeResult, -20000)
        
        let resultOver9Digits = sut?.multiply(firstNumber: 10000, secondNumber: 100000)
        XCTAssertEqual(resultOver9Digits, 1000000000)
        
        let multiplyByZero = sut?.multiply(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(multiplyByZero, 0)
        
        let positiveDecimalResult = sut?.multiply(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(positiveDecimalResult, 39562.005483 )
        
        let negativeDecimalResult = sut?.multiply(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(negativeDecimalResult, -123.9)
        
        let decimalsOver9Digits = sut?.multiply(firstNumber: 123.123456789123, secondNumber: 321.987654321)
        XCTAssertEqual(decimalsOver9Digits, 39644.233043423)
    
        let decimalsOutOfRange = sut?.multiply(firstNumber: 1234567.123, secondNumber: 7654321.321)
        XCTAssertEqual(decimalsOutOfRange, 9449773451784.53 )
    }

    func test_divide() {
        let positiveResult = sut?.divide(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(positiveResult, 0.5)
        
        let negativeResult = sut?.divide(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(negativeResult, -0.5)

        let divideByZero = sut?.divide(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(divideByZero, Double.infinity)
        
        let decimalsOver9Digits = sut?.divide(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(decimalsOver9Digits, 0.38317757)
    }
    
    func test_reset() {
        sut?.reset()
        XCTAssertTrue(sut?.stack.isEmpty == true)
    }
}
