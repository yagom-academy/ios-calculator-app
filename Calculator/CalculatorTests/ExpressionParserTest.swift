//
//  ExpressionParserTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/12.
//

import XCTest

class ExpressionParserTest: XCTestCase {
    var testString: String = ""
    
    override func setUp() {
        testString = "1.0 + 32.4 - -3.2 / 4.0 * 7.2"
    }
    
    override func tearDown() {
        testString = ""
    }
    
    func test_입력받은_문자열에서_피연산자만_잘_반환되는지() {
        let serparatedOperands = ExpressionParser.componentsByOperators(from: testString)
        XCTAssertEqual(["1.0","32.4","-3.2","4.0","7.2"], serparatedOperands)
    }
    
    func test_입력받은_문자열에서_피연산자와_연산자를_구분하여_Formula_타입의_인스턴스를_만들고_있는지() {
        let formula = ExpressionParser.parse(from: testString)
        
        [1.0, 32.4, -3.2, 4.0, 7.2].forEach { number in
            XCTAssertEqual(number, formula.operands.dequeue())
        }
        
        [Operator.add, Operator.subtract, Operator.divide, Operator.multiply].forEach { arithmetic in
            XCTAssertEqual(arithmetic, formula.operators.dequeue())
        }
    }
}
