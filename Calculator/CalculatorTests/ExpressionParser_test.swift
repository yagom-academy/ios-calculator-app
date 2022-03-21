//
//  ExpressionParser_test.swift
//  CalculatorTests
//
//  Created by SeoDongyeon on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParser_test: XCTestCase {
    var sut: ExpressionParser.Type!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_분할확인() {
        // given
        let array = "-1 + 2 * 3 / -1"
        let answer = ["-1", "+", "2", "*", "3", "/", "-1"]
        
        // when
        let result = ExpressionParser.componentsByOperators(from: array)
        
        // then
        XCTAssertEqual(result, answer)
    }
    
    func test_계산이_잘되는지() throws {
        // given
        let expression = "4 * 4 - 3 / 2"
        
        // when
        let result = try sut.parse(from: expression).result()
        
        // then
        XCTAssertEqual(result, 6.5)
    }
    
    func test_음수의_계산이_잘되는지() throws {
        // given
        let expression = "-2 * -5 / 2"
        
        // when
        let result = try sut.parse(from: expression).result()
        
        // then
        XCTAssertEqual(result, 5)
    }
    
    func test_0으로_나누었을때_오류처리를_하는지() throws {
        // given
        let expression = "-30 - -38 + 3 / 0 * 4"
        
        // when
        
        // then
        XCTAssertThrowsError(try sut.parse(from: expression).result())
    }
}
