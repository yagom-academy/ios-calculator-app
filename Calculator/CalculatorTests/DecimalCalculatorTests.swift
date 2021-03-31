//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//

import XCTest

class DecimalCalculatorTests: XCTestCase {
    private var decimalCalculatorTest: DecimalCalculator?
    
    override func setUpWithError() throws {
        decimalCalculatorTest = DecimalCalculator()
    }

    override func tearDownWithError() throws {
        decimalCalculatorTest = nil
    }

    func test_add() {
        // 양수 + 양수 = 양수
        let result1 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 300)
        
        // 양수 + 음수 = 음수
        let result2 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -100)
        
        // 9자리 이상의 결과도 add 단계에서는 그대로 return, 이후 formatting 과정을 통해 9자리 조건을 만족시킴
        let result3 = decimalCalculatorTest?.add(firstNumber: 900000000, secondNumber: 200000000)
        XCTAssertEqual(result3, 1100000000)
        
        // 0을 더하는 경우
        let result4 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 100)
        
        // 소수점을 포함한 덧셈 (2진수로 완벽하게 표현할 수 없는 수들의 덧셈)
        let result5 = decimalCalculatorTest?.add(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 444.444)
        
        // 소수점을 포함한 음수의 덧셈
        let result6 = decimalCalculatorTest?.add(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -1.3)
        
        // Double로 표현할 수 있는 범위 초과 시에는 소수 뒷자리를 자름
        let result7 = decimalCalculatorTest?.add(firstNumber: 10000000.123456789, secondNumber: 99999999.989898989)
        XCTAssertEqual(result7, 110000000.11335579)
    }
    
    func test_subtract() {
        // 양수 - 양수 = 음수
        let result1 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, -100)
        
        // 양수 - 음수 = 양수
        let result2 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, 300)
        
        let result3 = decimalCalculatorTest?.subtract(firstNumber: 1300000000, secondNumber: 200000000)
        XCTAssertEqual(result3, 1100000000)

        let result4 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 100)
        
        let result5 = decimalCalculatorTest?.subtract(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, -198.198)
        
        let result6 = decimalCalculatorTest?.subtract(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, 22.3)
        
        // 부동소수의 정확도의 문제로 인해 소수점 아래 9자리까지만 출력
        let result7 = decimalCalculatorTest?.subtract(firstNumber: 10000000.123456789, secondNumber: 99999999.989898989)
        XCTAssertEqual(result7, -89999999.8664422)
    }

    func test_multiply() {
        let result1 = decimalCalculatorTest?.multiply(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 20000)
        
        let result2 = decimalCalculatorTest?.multiply(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -20000)
        
        let result3 = decimalCalculatorTest?.multiply(firstNumber: 10000, secondNumber: 100000)
        XCTAssertEqual(result3, 1000000000)
        
        let result4 = decimalCalculatorTest?.multiply(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 0)
        
        let result5 = decimalCalculatorTest?.multiply(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 39562.005483 )
        
        let result6 = decimalCalculatorTest?.multiply(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -123.9)
        
        // 부동소수의 정확도의 문제로 인해 소수점 아래 9자리까지만 출력
        let result7 = decimalCalculatorTest?.multiply(firstNumber: 123.123456789123, secondNumber: 321.987654321)
        XCTAssertEqual(result7, 39644.233043423)
        
        // Double이 표현할 수 있는 범위를 초과하면 소수 뒷자리부터 자름
        let result8 = decimalCalculatorTest?.multiply(firstNumber: 1234567.123, secondNumber: 7654321.321)
        XCTAssertEqual(result8, 9449773451784.53 )
    }

    func test_divide() {
        let result1 = decimalCalculatorTest?.divide(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 0.5)
        
        let result2 = decimalCalculatorTest?.divide(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -0.5)
        
        let result3 = decimalCalculatorTest?.divide(firstNumber: 10000, secondNumber: 100000)
        XCTAssertEqual(result3, 0.1)
        
        let result4 = decimalCalculatorTest?.divide(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, Double.infinity)
        
        // 부동소수의 정확도의 문제로 인해 소수점 아래 9자리까지만 출력
        let result5 = decimalCalculatorTest?.divide(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 0.38317757)
        
        let result6 = decimalCalculatorTest?.divide(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -0.889830508)
    }
    
    func test_reset() {
        decimalCalculatorTest?.reset()
        XCTAssertTrue(decimalCalculatorTest?.stack.isEmpty == true)
    }
}
