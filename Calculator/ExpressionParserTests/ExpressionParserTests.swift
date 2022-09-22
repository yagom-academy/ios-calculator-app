//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by jin on 9/22/22.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

//    func test_split_string_to_components_by_operators() throws {
//        let input = "3+42-7÷32"
//        
//        let result = ExpressionParser.componentsByOperators(from: input)
//        
//        
//        XCTAssertEqual(result, ["3", "+", "42", "-", "7", "÷", "32"])
//    }
    
    func test_if_formula_is_made() {
        
        let input = "3+42-7÷32"
        
        let result = ExpressionParser.parse(from: input)
        
        let expectedResult = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        expectedResult.operands.enqueue(item: 3)
        expectedResult.operands.enqueue(item: 42)
        expectedResult.operands.enqueue(item: 7)
        expectedResult.operands.enqueue(item: 32)
        expectedResult.operators.enqueue(item: .add)
        expectedResult.operators.enqueue(item: .subtract)
        expectedResult.operators.enqueue(item: .divide)
        
        XCTAssertEqual(result.operands.dequeue(), expectedResult.operands.dequeue())
        XCTAssertEqual(result.operands.dequeue(), expectedResult.operands.dequeue())
        XCTAssertEqual(result.operands.dequeue(), expectedResult.operands.dequeue())
        XCTAssertEqual(result.operands.dequeue(), expectedResult.operands.dequeue())
        
        XCTAssertEqual(result.operators.dequeue(), expectedResult.operators.dequeue())
        XCTAssertEqual(result.operators.dequeue(), expectedResult.operators.dequeue())
        XCTAssertEqual(result.operators.dequeue(), expectedResult.operators.dequeue())
        
    }

}
