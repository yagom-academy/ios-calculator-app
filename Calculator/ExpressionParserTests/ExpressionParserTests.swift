//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Derrick kim on 2022/05/20.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var operators: CalculatorItemQueue<Operator>?
    var operands: CalculatorItemQueue<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operators = CalculatorItemQueue<Operator>()
        operands = CalculatorItemQueue<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operators = nil
        operands = nil
    }
    
    func test_문자열로_들어온_값을_분리하여_Double_숫자를_반환하다() {
        // given
        let str = "3.2 4.5 5 - 1 +"
        let expectation = 3.2
        
        // when
        let result = str.split(with: " ")
            .compactMap { Double($0) }
            .map{ $0 }[0]
        
        // then
        XCTAssertEqual(result, expectation)
    }
  
    func test_문자열로_들어온_값을_분리하여_Double_숫자를_반환하다_Version2() {
        // given
        let str = "3.2 4.5 5 - 1 + -5"
        let expectation = 3.2
        
        // when
        str.split(with: " ")
            .compactMap{ Double($0) }
            .forEach{ value in
            
                operands!.enqueue(value)
            }
        
        let result = try! operands!.peekFirst
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_문자열로_들어온_값을_분리하여_operand_를_fomular에_넣어서_첫째값을_반환하다() {
        // given
        let str = "3.2 - 4.5 + 5 - 1"
        let expectation = 3.2
        
        let formula = ExpressionParser.parse(from: str)
        let result = formula.operands.peekFirst
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_문자열로_들어온_값을_나누기_연산자를_사용하여_NAN_반환하다() {
        // given
        let str = "3.0 × 4.3 - 5 - 1 ÷ 0 "
        var expectation = true
    
        // when
        let formula = ExpressionParser.parse(from: str)
        
        let result = formula.result()
        
        if (result.isNaN) {
            expectation = false
        }
        
        // then
        XCTAssertFalse(expectation)
    }
}
 
