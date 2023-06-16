//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by hoon, hemg on 2023/06/06.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_parse_수식이주어지면_연산자를기준으로문자열을나누고_각각의Queue에맞게입력한다() {
        // given
        let expectedString: String = "1+2"
        
        // when
        var formula: Formula = ExpressionParser.parse(from: expectedString)
        
        // then
        XCTAssertEqual(formula.operands.dequeue(), 1)
        XCTAssertEqual(formula.operands.dequeue(), 2)
        XCTAssertEqual(formula.operators.dequeue(), .add)
    }
    
    func test_parse_수식이주어지면_음수인피연산자를찾아_subtract연산자와구분하여_연산결과5를반환한다() {
        // given
        let expectedString: String = "1+2÷-3−-6"
        
        // when
        var formula: Formula = ExpressionParser.parse(from: expectedString)
        
        // then
        XCTAssertEqual(try formula.result(), 5)
    }
    
    func test_parse_수식에처음으로마이너스기호가주어지면_subtract연산자와구분하여_연산결과5를반환한다() {
        // given
        let expectedString: String = "-1×-3+6÷-3"
        
        // when
        var formula: Formula = ExpressionParser.parse(from: expectedString)
        
        // then
        XCTAssertEqual(try formula.result(), -3)
    }
    
    func test_2_빼기_음수1_더하기_1_했을때_1이나오는지확인() {
        // Given
        let expectedString: String = "2−1+1+1"
        
        // When
        var formula: Formula = ExpressionParser.parse(from: expectedString)
        
        // Then
        XCTAssertEqual(formula.operands.dequeue(), 2.0)
        XCTAssertEqual(formula.operators.dequeue(), .subtract)
        XCTAssertEqual(formula.operands.dequeue(), 1.0)
        XCTAssertEqual(formula.operators.dequeue(), .add)
        XCTAssertEqual(formula.operands.dequeue(), 1.0)
        XCTAssertEqual(formula.operators.dequeue(), .add)
        XCTAssertEqual(formula.operands.dequeue(), 1.0)
    }
}
