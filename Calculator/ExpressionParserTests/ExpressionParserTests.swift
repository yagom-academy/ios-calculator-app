//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Erick on 2023/06/02.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func test_공식_ExpressionParser의_parse에_넣으면_Formula가_반환되어_result를_호출하면_답이_반환됩니다() {
        let input = "1 + 3"
        
        let expectation: Double = 4
        
        var formula = ExpressionParser.parse(from: input)
        
        let result = formula.result()
        
        XCTAssertEqual(result, expectation)
    }
}
