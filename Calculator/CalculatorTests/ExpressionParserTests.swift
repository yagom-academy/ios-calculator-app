//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/14.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
//    func test_한가지_연산자만_있을_때_String_배열로_잘_분리되는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "1+3"), ["1", "3"])
//    }
//
//    func test_다양한_수에_한가지_연산자만_있을_때_String_배열로_잘_분리되는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "1+3+4+6"), ["1", "3", "4", "6"])
//    }
//
//    func test_다양한_수에_다양한_연산자가_있을_경우_잘_분리되는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "1+3-4/1*3"), ["1", "3", "4", "1", "3"])
//    }
//
//    func test_음수가_있을때_연산자를_빼고_음수로_변환하는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "−1+−2+34-−12"), ["−1", "−2", "34", "−12"])
//    }
    
    func test_다양한_String_일_경우_각각_빈_배열로_생성되는지() {
        let sut = ExpressionParser.parse(from: "1+2+32-12")
        
        XCTAssertEqual(sut.operators.items, [Operator.add, Operator.add, Operator.subtract])
        XCTAssertEqual(sut.operands.items, [1, 2, 32, 12] )
    }
    
    func test_빈_String일_경우_각각_빈_배열로_생성되는지() {
        let sut = ExpressionParser.parse(from: "")
        
        XCTAssertEqual(sut.operands.items, [])
        XCTAssertEqual(sut.operators.items, [])
    }
    
    func test_음수를_포함한_String일_경우_음수가_잘_인식되는지() {
        let sut = ExpressionParser.parse(from: "−1+−2+34-−12")
        
        XCTAssertEqual(sut.operators.items, [Operator.add, Operator.add, Operator.subtract])
        XCTAssertEqual(sut.operands.items, [-1, -2, 34, -12] )
    }
}
