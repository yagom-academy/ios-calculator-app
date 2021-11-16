//
//  ExpressionParserTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/12.
//

import XCTest

class ExpressionParserTest: XCTestCase {
    var expression: String = ""
    
    override func setUp() {
        expression = "1.0 + 32.4 - -3.2 ÷ 4.0 × 7.2"
    }
    
    override func tearDown() {
        expression = ""
    }
    
    func test_입력받은_문자열에서_피연산자와_연산자를_구분하여_Formula_타입의_인스턴스를_만들고_있는지() {
        let formula = ExpressionParser.parse(from: expression)
        
        [1.0, 32.4, -3.2, 4.0, 7.2].forEach { number in
            XCTAssertEqual(number, formula.operands.dequeue())
        }
        
        [Operator.add, Operator.subtract, Operator.divide, Operator.multiply].forEach { arithmetic in
            XCTAssertEqual(arithmetic, formula.operators.dequeue())
        }
    }
    
    func test_추출해낸_Formula_인스턴스가_정상적인_연산을_하는지() {
        let formula = ExpressionParser.parse(from: expression)
        XCTAssertEqual((1.0 + 32.4 - (-3.2)) / 4.0 * 7.2, try formula.result())
    }
    
    func test_0으로_중간에_나누는_경우_에러가_반환되는지() {
        let divideByZeroExpression = "1.0 + 32.4 - -3.2 ÷ 0.0 × 7.2"
        let formula = ExpressionParser.parse(from: divideByZeroExpression)
        XCTAssertThrowsError(try formula.result()) { error in
            XCTAssertEqual(error as? OperationError, OperationError.dividedByZero)
        }
    }
}
