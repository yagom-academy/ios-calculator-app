//
//  FomulaTests.swift
//  FomulaTests
//
//  Created by 김태훈 on 2022/03/29.
//

import XCTest
@testable import Calculator

class FomulaTests: XCTestCase {
    var sut: Fomula!
    
    override func setUpWithError() throws {
        sut = Fomula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result_함수를_호출하면_1더하기1은_2가되는지() {
        // given
        let fomula = "1 + 1"
        // when
        var result = ExpressionParser.parse(frome: fomula)
        // then
        switch result.result() {
        case .success(let value):
            XCTAssertEqual(value, 2.0)
        case .failure(let error):
            XCTAssertEqual(error, CalculatorError.nonOperator)
        }
        
    }
    
    func test_result_함수_호출시_nonOperator_error가_발생하는지() {
        // given
        let fomula = "1 + 1 1"
        // when
        var result = ExpressionParser.parse(frome: fomula)
        // then
        switch result.result() {
        case .success(let value):
            XCTAssertEqual(value, 2.0)
        case .failure(let error):
            XCTAssertEqual(error, CalculatorError.nonOperator)
        }
    }
    
    func test_result_함수_호출시_nonOperand_error가_발생하는지() {
        // given
        let fomula = "1 + 1 +"
        // when
        var result = ExpressionParser.parse(frome: fomula)
        // then
        switch result.result() {
        case .success(let value):
            XCTAssertEqual(value, 2.0)
        case .failure(let error):
            XCTAssertEqual(error, CalculatorError.nonOperand)
        }
    }
    
    func test_result_함수_호출시_divisionByZero_error가_발생하는지() {
        // given
        let fomula = "2 ÷ 0"
        // when
        var result = ExpressionParser.parse(frome: fomula)
        // then
        switch result.result() {
        case .success(let value):
            XCTAssertEqual(value, Double.infinity)
        case .failure(let error):
            XCTAssertEqual(error, CalculatorError.divisionByZero)
        }
    }
}
