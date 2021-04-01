//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김찬우 on 2021/03/29.
//

import XCTest
//@testable import net.yagom.Calculator
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var testDecimalCalculator = DecimalCalculator()
    
    override func setUpWithError() throws {
        testDecimalCalculator = DecimalCalculator()
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is caled after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        test_devide_한자리정수_두개()
        test_multiply_한자리정수_두개()
        test_convertType_일을입력했을때_return값확인()
        test_convertType_플러스를입력했을때_return값확인()
        test_calculate_플러스를입력했을때_return값확인()
        test_showTopOfStack_열자리수입력했을때_확인()
    }
    
    func test_devide_한자리정수_두개() {
        XCTAssertEqual(testDecimalCalculator.divide(1, by: 2), 0.5)
    }
    
    func test_multiply_한자리정수_두개() {
        XCTAssertEqual(testDecimalCalculator.multiply(1, by: 2), 2)
    }
    
    func test_convertType_일을입력했을때_return값확인() {
        XCTAssertEqual(testDecimalCalculator.convertType(inputNumber: "1"), 1)
    }
    
    func test_convertType_플러스를입력했을때_return값확인() {
        XCTAssertEqual(testDecimalCalculator.convertType(inputOperator: "+"), .addition)
    }
    
    func test_calculate_플러스를입력했을때_return값확인() {
        XCTAssertEqual(testDecimalCalculator.calculate(operateSign: "+", operatedNumber: 1, operatingNumber: 1), 2)
    }
    
    func test_showTopOfStack_열자리수입력했을때_확인() {
        testDecimalCalculator.stack.push(10000000000.0)

        print(testDecimalCalculator.stack.top!) // 어떤 목적으로 하는거에요?
        XCTAssertEqual(print(testDecimalCalculator.showTopOfStack()), 1.0)
    }
}
//  뭐가 안나와요?
// testDecimalCalculator.showTopOfStack() 얘가 뭘 나타내는 앤데요?
// 만들기만 했잖아요
// 눌렀어요
// 다시 한번 잘 생각해봐요 비교하려는 함수가 무얼 나타내고'는' 있는지
