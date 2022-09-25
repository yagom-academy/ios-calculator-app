//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by yonggeun Kim on 2022/09/25.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse_operands에_input을_넣었을때_dequeue값이_operand만_나와야함() {
        let input = "23+13-53*14/6"
        var result = ExpressionParser.parse(from: input).operands
        
        let testOperands: [Double] = [23, 13, 53, 14, 6]
        
        XCTAssertEqual(testOperands[0], result.dequeue())
        XCTAssertEqual(testOperands[1], result.dequeue())
        XCTAssertEqual(testOperands[2], result.dequeue())
        XCTAssertEqual(testOperands[3], result.dequeue())
        XCTAssertEqual(testOperands[4], result.dequeue())
    }
    
    func test_parse_operators에_input을_넣었을때_dequeue값이_operator만_나와야함() {
        let input = "23+13-53*14/6"
        var result = ExpressionParser.parse(from: input).operators
        
        let testOperators = ["+", "-", "*", "/"]
        
        XCTAssertEqual(Operator(rawValue: Character(testOperators[0])), result.dequeue())
        XCTAssertEqual(Operator(rawValue: Character(testOperators[1])), result.dequeue())
        XCTAssertEqual(Operator(rawValue: Character(testOperators[2])), result.dequeue())
        XCTAssertEqual(Operator(rawValue: Character(testOperators[3])), result.dequeue())
    }
}
