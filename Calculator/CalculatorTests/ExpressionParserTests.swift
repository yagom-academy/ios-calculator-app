//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/20/24.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var formulaSut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue()
        operators = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
    }
    
    func test_ExpressionParser_parse_실행결과_테스트() {
        // given
        formulaSut = ExpressionParser.parse(from: "123 + 234 +")
        
        // when
        let expectationOfOperands: [Double] = [123, 234]
        let expectationOfOperators: [Operator] = [Operator.add, Operator.add]
        expectationOfOperands.forEach { operands.push($0) }
        expectationOfOperators.forEach { operators.push($0) }
        
        let resultOfOperands = formulaSut.operands.queue
        let resultOfOperators = formulaSut.operators.queue
        
        // then
        XCTAssertEqual(expectationOfOperands, resultOfOperands)
        XCTAssertEqual(expectationOfOperators, resultOfOperators)
    }
}
