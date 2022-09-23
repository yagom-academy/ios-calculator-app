//
//  ExpressionParserTests.swift
//  Created by Wonbi
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_componentsByOperators메서드에1더하기2곱하기3을넣었을때_1과2와3이나오는지() {
        let input = "1+2×3"
        
        let result = ExpressionParser.componentsByOperators(from: input)
    
        let expectedValue: [String] = ["1", "2", "3"] 
        XCTAssertEqual(expectedValue, result)
    }
}
