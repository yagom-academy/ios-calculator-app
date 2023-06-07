//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Serena on 2023/06/06.
//

import XCTest
@testable import Calculator


final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // CalculateItem,Formula,CalculatorItemQueue Equatable 채택 시 가능
//    func test_덧셈_string을_넣으면_Formula를_반환한다() {
//        let expectedResult = Formula(operands: CalculatorItemQueue(queue: [2, -1]), operators: CalculatorItemQueue(queue:["−"]))
//
//        let input = "2−-1"
//        let result = ExpressionParser.parse(from: input)
//
//        XCTAssertEqual(expectedResult, result)
//    }
}
