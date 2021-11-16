//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    func test_split_함수의_결과_확인() {
        XCTAssertEqual(["a", "b"], "a b".split(with: " "))
    }

    func test_1_더하기_2의_결과가_3인가() {
        
        XCTAssertEqual(33.0, try ExpressionParser.parse(from: "13 + 20").result())
    }
    
    func test_9_나누기_3의_결과가_3인가() {
        
        XCTAssertEqual(3.0, try ExpressionParser.parse(from: "9.0 / 3.0").result())
    }
    
    func test_0으로_나눌경우_오류처리가_되는가() {
        XCTAssertThrowsError(try ExpressionParser.parse(from: "9 / 0").result()) { error in
            XCTAssertEqual(error as? Formula.FormulaError, Formula.FormulaError.NaN)
        }
    }

}
