//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Kiseok on 2023/10/11.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_parse호출시_전달된문자열순서대로formula의queue에담기는지() throws {
        //given
        let formula = try ExpressionParser.parse(from: "1 + 2 - 3 x 4 / 5")
        let expectedFormulaOperators: [Operator] = [.add, .subtract, .multiply, .divide]
        let expectedFormulaOperands: [Double] = [1, 2, 3, 4, 5]
        
        //then
        XCTAssertEqual(expectedFormulaOperands, formula.operands.enqueueBox)
        XCTAssertEqual(expectedFormulaOperators, formula.operators.enqueueBox)
    }

}
