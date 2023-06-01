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
    
    func test_숫자_연산자_소수점이_아닌_피연산자가_포함되어있는_문자열_수식을_parse하면_invalidInput_에러가_발생한다() throws {
        // given
        let input1 = "5+ㄱ"
        let input2 = "13-2a"
        let input3 = "20.13+13,34"
        let input4 = "5+1-10.43/13"
        let input5 = "5 + 1 - 10.43 ÷ 13"
        // then
        try [input1, input2, input3, input4, input5].forEach { input in
            XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
                if let error = error as? CalculationError {
                    XCTAssertEqual(error, .invalidInput)
                } else {
                    XCTFail("예상하지 않은 에러 출력 \(error)")
                }
            }
        }
    }
    
    func test_소수점이_여러_개인_피연산자를_parse하면_invalidInput_에러가_발생한다() throws {
        // given
        let input1 = "5.13.4+10"
        let input2 = "1.0.10.0"
        let input3 = "1..3+1.0"
        let input4 = "10.0.0-10"
        
        // then
        try [input1, input2, input3, input4].forEach { input in
            XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
                if let error = error as? CalculationError {
                    XCTAssertEqual(error, .invalidInput)
                } else {
                    XCTFail("예상하지 않은 에러 출력 \(error)")
                }
            }
        }
    }
}
