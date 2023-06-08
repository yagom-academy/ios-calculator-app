//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Serena on 2023/06/06.
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
    
    // CalculateItem,Formula,CalculatorItemQueue Equatable 채택 시 가능
//    func test_덧셈_string을_넣으면_Formula를_반환한다() {
//        let expectedResult = Formula(operands: CalculatorItemQueue(queue: [2, -1]), operators: CalculatorItemQueue(queue:[Operator.substract]))
//
//        let input = "2−-1"
//        let result = ExpressionParser.parse(from: input)
//
//        XCTAssertEqual(expectedResult, result)
//    }
    
    func test_계산식을_넣으면_처음_입력된_숫자를_반환한다() {
        let input = "1+2"
        
        let expectedResult: Double = 1
        
        let checkNumber: Double = ExpressionParser.parse(from: input).operands.peek!
        
        XCTAssertEqual(expectedResult, checkNumber)
    }
    
    func test_계산식을_넣으면_두번째_입력된_숫자를_반환한다() {
        let input = "1+2"
        
        let expectedResult: Double = 2
        
        var checkNumber = ExpressionParser.parse(from: input)
        checkNumber.operands.dequeue()
        let result = checkNumber.operands.peek
        
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
