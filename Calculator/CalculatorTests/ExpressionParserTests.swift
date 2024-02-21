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
        formulaSut = ExpressionParser.parse(from: "123 + 234 +")
        
        let operandsDummy: [Double] = [123, 234]
        let operatorsDummy: [Operator] = [Operator.add, Operator.add]
        operandsDummy.forEach { operands.push($0) }
        operatorsDummy.forEach { operators.push($0) }
        
        let resultOfOperands: CalculatorItemQueue<Double> = formulaSut.operands
        let resultOfOperators: CalculatorItemQueue<Operator> = formulaSut.operators
        
        XCTAssertEqual(operands.Queue, resultOfOperands.Queue)
        XCTAssertEqual(operators.Queue, resultOfOperators.Queue)
    }
}
