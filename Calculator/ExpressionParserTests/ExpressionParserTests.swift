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
    
    func test_공식을_parse에_넣으면_Formula가_반환되어_result를_호출하면_답이_반환됩니다() {
        let input = "1 + 3"
        var formula = ExpressionParser.parse(from: input)
        let expectation: Double = 4
        
        let result = formula.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_nan이_반환되는_공식을_parse에_넣으면_result도_nan이_반환됩니다() {
        let input = "1 + 3 / 0 * 10"
        var formula = ExpressionParser.parse(from: input)
        
        let result = formula.result().isNaN
        
        XCTAssertTrue(result)
    }
}
