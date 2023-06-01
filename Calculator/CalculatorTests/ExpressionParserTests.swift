//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Minsup on 2023/06/01.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_간단하고_정상적인_문자열_수식을_parse_하면_Formula_객체안에_연산자와_피연산자가_분리되어_순서대로_queue에_쌓인다() throws {
        // given
        let input = "5+3"
        let expectation = Formula(
            operands: CalculatorItemQueue<Double>([5, 3]),
            operators: CalculatorItemQueue<Operator>([.add])
        )
        
        // when
        let result = try ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.elements, expectation.operands.elements)
        XCTAssertEqual(result.operators.elements, expectation.operators.elements)
    }
    
    func test_복잡하고_정상적인_문자열_수식을_parse_하면_Formula_객체안에_연산자와_피연산자가_분리되어_순서대로_queue에_쌓인다() throws {
        // given
        let input = "5+3×2.5÷10-30.14"
        let expectation = Formula(
            operands: CalculatorItemQueue<Double>([5, 3, 2.5, 10, 30.14]),
            operators: CalculatorItemQueue<Operator>([.add, .multiply, .divide, .subtract])
        )
        
        // when
        let result = try ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.elements, expectation.operands.elements)
        XCTAssertEqual(result.operators.elements, expectation.operators.elements)
    }
    
    func test_간단하고_숫자가아닌_피연산자가_포함되어있는_문자열_수식을_parse하면_invalidInput_에러가_발생한다() {
        // given
        let input = "5+ㄱ"
        
        // then
        XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .invalidInputNumber)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_복잡하고_숫자가아닌_피연산자가_포함되어있는_문자열_수식을_parse하면_invalidInput_에러가_발생한다() {
        // given
        let input = "5+1-10.43÷ㅣ13"
        
        // then
        XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .invalidInputNumber)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_소수점이_여러개인_피연산자를_parse하면_invalidInputPoint_에러가_발생한다() {
        // given
        let input = "5.13.4"
        
        // then
        XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .invalidInputPoint)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
}
