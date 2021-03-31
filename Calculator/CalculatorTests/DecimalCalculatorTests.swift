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
        let result1 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 300)
        
        let result2 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -100)
        
        let result3 = decimalCalculatorTest?.add(firstNumber: 900000000, secondNumber: 200000000)
        XCTAssertEqual(result3, 1100000000)
        
        let result4 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 100)
        
        let result5 = decimalCalculatorTest?.add(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 444.444)
        
        let result6 = decimalCalculatorTest?.add(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -1.3)
    }
    
    func test_subtract() {
        let result1 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, -100)
        
        let result2 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, 300)
        
        let result3 = decimalCalculatorTest?.subtract(firstNumber: 900000000, secondNumber: 200000000)
        XCTAssertEqual(result3, 700000000)
        
        let result4 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 100)
        
        let result5 = decimalCalculatorTest?.subtract(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, -198.198)
        
        let result6 = decimalCalculatorTest?.subtract(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, 22.3)
        
        let result7 = decimalCalculatorTest?.subtract(firstNumber: 10.1234123412341234, secondNumber: -11.4321432143214321)
        XCTAssertEqual(result7, 21.555555556)
        
        let result8 = decimalCalculatorTest?.subtract(firstNumber: 0.1234123412341234, secondNumber: -1.4321477743214321)
        XCTAssertEqual(result8, 1.555560116)
        
        // Double로 표현할 수 있는 범위 초과 시 소수 뒷자리를 자름
        let result9 = decimalCalculatorTest?.subtract(firstNumber: 10000000.123456789, secondNumber: 99999999.989898989)
        XCTAssertEqual(result9, -89999999.8664422)
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
        
        // Double이 표현할 수 있는 범위를 초과하면 소수 뒷자리부터 자름
        let result7 = decimalCalculatorTest?.multiply(firstNumber: 1234567.123, secondNumber: 7654321.321)
        XCTAssertEqual(result7, 9449773451784.53 )
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
        
        // 소수점은 하위 9자리 까지만 출력
        let result5 = decimalCalculatorTest?.divide(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 0.38317757)
        
        // 소수점은 하위 9자리 까지만 출력
        let result6 = decimalCalculatorTest?.divide(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -0.889830508)
    }
    
    func test_reset() {
        decimalCalculatorTest?.reset()
        XCTAssertTrue(decimalCalculatorTest?.stack.isEmpty == true)
    }
}
