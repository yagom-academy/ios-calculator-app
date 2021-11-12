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
        let ep = ExpressionParser()
        
        let fomula: Formula = ep.parse("1 + 2")
        XCTAssertEqual(3.0, try ExpressionParser.parse(from: "1 + 2").result())
    }
        
        XCTAssertEqual(3.0, fomula.result())
    }

}
