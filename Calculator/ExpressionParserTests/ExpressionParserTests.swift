//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by yyss99, Serena on 2023/06/14.
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
    
    func test_계산식을_넣으면_처음_입력된_숫자를_반환한다() {
        let input = "1+2"
        
        let expectedResult: Double = 1
        
        var testFormula = ExpressionParser.parse(from: input)
        let checkNumber = testFormula.operands.dequeue()
        
        XCTAssertEqual(expectedResult, checkNumber)
    }
    
    func test_계산식을_넣으면_두번째_입력된_숫자를_반환한다() {
        let input = "1+2"
        
        let expectedResult: Double = 2
        
        var checkNumber = ExpressionParser.parse(from: input)
        checkNumber.operands.dequeue()
        let result = checkNumber.operands.dequeue()
        
        XCTAssertEqual(expectedResult, result)
    }

    func test_계산식을_넣으면_입력된_연산자를_반환한다() {
        let input = "1+2"
        
        let expectedResult: Operator = Operator.add
        
        var checkNumber = ExpressionParser.parse(from: input)
        let result = checkNumber.operators.dequeue()
        
        XCTAssertEqual(expectedResult, result)
    }
}
