//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Dylan_Y on 2022/09/27.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse실행시_정상적인값을_입력했을_때_입력개수와_result_값이_같은지() {
        // given
        let given = "132+14.5/112.3*13"
        let expression2Result = (132.0+14.5)/10.0*13.0
        var operands: CalculatorItemQueue!
        var operators: CalculatorItemQueue!
        
        operands.enqueue(132.0)
        operands.enqueue(14.5)
        operands.enqueue(10.0)
        operands.enqueue(13.0)
        
        operators.enqueue(Operator.add)
        operators.enqueue(Operator.divide)
        operators.enqueue(Operator.multiply)
        
        // when
        var result = ExpressionParser.parse(from: given)
        
        // then
        XCTAssertEqual(result.operators.count, operands.count)
        XCTAssertEqual(result.operators.count, operators.count)
        XCTAssertEqual(try result.result(), expression2Result)
    }
}
