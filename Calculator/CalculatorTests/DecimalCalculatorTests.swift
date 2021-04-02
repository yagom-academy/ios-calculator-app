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
        // 양수 + 양수 = 양수
        let positiveResult = sut?.add(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(positiveResult, 300)
        
        // 양수 + 음수 = 음수
        let negativeResult = sut?.add(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(negativeResult, -100)
        
        // 9자리 이상의 결과도 add 단계에서는 그대로 return, 이후 formatting 과정을 통해 9자리 조건을 만족시킴
        let resultOver9Digits = sut?.add(firstNumber: 900000000, secondNumber: 200000000)
        XCTAssertEqual(resultOver9Digits, 1100000000)
        
        // 0을 더하는 경우
        let addZero = sut?.add(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(addZero, 100)
        
        // 소수점을 포함한 덧셈 (2진수로 완벽하게 표현할 수 없는 수들의 덧셈)
        let addDecimalNumber = sut?.add(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(addDecimalNumber, 444.444)
        
        // 소수점을 포함한 음수의 덧셈
        let negativeDecimalResult = sut?.add(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(negativeDecimalResult, -1.3)
        
        // Double로 표현할 수 있는 범위 초과 시에는 소수 뒷자리를 자름
        let decimalsOutOfRange = sut?.add(firstNumber: 10000000.123456789, secondNumber: 99999999.989898989)
        XCTAssertEqual(decimalsOutOfRange, 110000000.11335579)
    }
    
    func test_subtract() {
        // 양수 - 양수 = 음수
        let negativeResult = sut?.subtract(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(negativeResult, -100)
        
        // 양수 - 음수 = 양수
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
        
        // 부동소수의 정확도의 문제로 인해 소수점 아래 9자리까지만 출력
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
        
        // 부동소수의 정확도의 문제로 인해 소수점 아래 9자리까지만 출력
        let decimalsOver9Digits = sut?.multiply(firstNumber: 123.123456789123, secondNumber: 321.987654321)
        XCTAssertEqual(decimalsOver9Digits, 39644.233043423)
        
        // Double이 표현할 수 있는 범위를 초과하면 소수 뒷자리부터 자름
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
        
        // 부동소수의 정확도의 문제로 인해 소수점 아래 9자리까지만 출력
        let decimalsOver9Digits = sut?.divide(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(decimalsOver9Digits, 0.38317757)
    }
    
    func test_reset() {
        sut?.reset()
        XCTAssertTrue(sut?.stack.isEmpty == true)
    }
}
