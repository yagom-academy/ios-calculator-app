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

    func test_parse호출시_전달된문자열순서대로formula의queue에담기는지() {
        //given
        let formula = ExpressionParser.parse(from: "11+22－33*44/55")
        let expectedFormulaOperators: [Operator] = [.add, .subtract, .multiply, .divide]
        let expectedFormulaOperands: [Double] = [11, 22, 33, 44, 55]
        
        //then
        XCTAssertEqual(expectedFormulaOperands, formula.operands.enqueueBox)
        XCTAssertEqual(expectedFormulaOperators, formula.operators.enqueueBox)
    }
    
    func test_parse호출시_전달된문자열에음수가있을시_queue에음수가담기는지() {
        //given
        let formula = ExpressionParser.parse(from: "11+22－-33*44/55")
        let expectedFormulaOperators: [Operator] = [.add, .subtract, .multiply, .divide]
        let expectedFormulaOperands: [Double] = [11, 22, -33, 44, 55]
        
        //then
        XCTAssertEqual(expectedFormulaOperands, formula.operands.enqueueBox)
        XCTAssertEqual(expectedFormulaOperators, formula.operators.enqueueBox)
    }
    
    func test_parse호출시_공백을포함한문자열을전달했을때_공백없이queue에담기는지() {
        let formula = ExpressionParser.parse(from: "1 1+ 22－33 * 44/ 55")
        let expectedFormulaOperators: [Operator] = [.add, .subtract, .multiply, .divide]
        let expectedFormulaOperands: [Double] = [11, 22, 33, 44, 55]
        
        //then
        XCTAssertEqual(expectedFormulaOperands, formula.operands.enqueueBox)
        XCTAssertEqual(expectedFormulaOperators, formula.operators.enqueueBox)
    }
    
    func test_parse호출시_빈문자열을전달했을때_queue가비어있는지() throws {
        //given
        let formula = ExpressionParser.parse(from: "")
        let expectedFormulaOperators: [Operator] = []
        let expectedFormulaOperands: [Double] = []
        
        //then
        XCTAssertEqual(expectedFormulaOperands, formula.operands.enqueueBox)
        XCTAssertEqual(expectedFormulaOperators, formula.operators.enqueueBox)
    }

}
