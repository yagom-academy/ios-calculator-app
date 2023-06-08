//
//  FormulaTests.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/07.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_result_1과_10을_더하면_예상값은_11이다() {
        // given
        let input = "1 + 10"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = 11
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_result_1에서_10을_빼면_예상값은_마이너스9이다() {
        // given
        let input = "1 - 10"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = -9
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_result_1과_마이너스10을_더하면_예상값은_마이너스9다() {
        // given
        let input = "1 + -10"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = -9
        
        // then
        XCTAssertEqual(result, expectedValue)
    }

    func test_result_1을_2로_나누면_예상값은_0점5다() {
        // given
        let input = "1 ÷ 2"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = 0.5
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_result_10_곱하기_2를_하며_예상값은_20다() {
        // given
        let input = "10 × 2"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = 20
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_result_2와_10을_더하고_2로_나누면_예상값은_6이다() {
        // given
        let input = "2 + 10 ÷ 2"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = 6
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_result_2을_0으로_나누면_divideError에러에_걸린다() {
        // given
        let input = "2 ÷ 0"
        sut = ExpressionParser.parse(from: input)
        
        let errorMassage: CalculatorError = CalculatorError.divideError
        var error: CalculatorError?
        
        // when
        XCTAssertThrowsError(try sut.result()){ result in
            error = result as? CalculatorError
        }

        // then
        XCTAssertEqual(error, errorMassage)
    }
    
    func test_result_0을_2로_나누면_예상값은_0이다() {
        // given
        let input = "0 ÷ 2"
        sut = ExpressionParser.parse(from: input)
        
        // when
        let result = try! sut.result()
        let expectedValue: Double = 0
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_result_2_나누기만_입력하면_divideError에러에_걸린다() {
        // given
        let input = "2 ÷"
        sut = ExpressionParser.parse(from: input)
        
        let errorMassage: CalculatorError = CalculatorError.incompleteFormula
        var error: CalculatorError?
        
        // when
        XCTAssertThrowsError(try sut.result()){ result in
            error = result as? CalculatorError
        }

        // then
        XCTAssertEqual(error, errorMassage)
    }
}
