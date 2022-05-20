//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Derrick kim on 2022/05/20.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_문자열로_들어온_값을_분리하여_연산자를_반환하다() {
        // given
        let str = "3.2 4.5 5 - 1 +"
        let expectation = Operator.subtract
        
        // when
        let char = str.split(with: " ")
            .filter{ Double($0) == nil }
            .compactMap{ Character($0) }
            .filter{ Operator.contains($0) }
        
        let result = Operator(rawValue: char[0])
        
        // then
        XCTAssertEqual(result, expectation)
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
    
    func test_문자열로_들어온_값을_분리하여_연산자를_반환하다_Version2() {
        // given
        let str = "3.2 4.5 5 - 1 +"
        let expectation = Operator.subtract
        
        // when
        let char = ExpressionParser.componentsByOperators(from: str)
        
        let result = Operator(rawValue: char[0])
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_문자열로_들어온_값을_분리하여_Double_숫자를_반환하다_Version2() {
        // given
        let str = "3.2 4.5 5 - 1 +"
        let expectation = 3.2
        
        // when
        let result = ExpressionParser.componentsByOperands(from: str).map{ Double($0) }[0]
                
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_문자열로_들어온_값을_분리하여_operator를_fomular에_넣어서_첫째값을_반환하다() {
        // given
        let str = "3.2 4.5 5 - 1 +"
        let expectation = Operator.subtract
        
        let operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        ExpressionParser.componentsByOperands(from: str).map{
            operands.enqueue(Double($0) ?? 0.0)
        }
        
        let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        ExpressionParser.componentsByOperators(from: str).map{
            operators.enqueue(Operator(rawValue: $0) ?? .add)
        }
        // when
        let formula = Formula(operands: operands, operators: operators)
        
        let result = formula.operators.peekFirst
                
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_문자열로_들어온_값을_분리하여_operand_를_fomular에_넣어서_첫째값을_반환하다() {
        // given
        let str = "3.2 4.5 5 - 1 +"
        let expectation = 3.2
        
        let operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        ExpressionParser.componentsByOperands(from: str).map{
            operands.enqueue(Double($0) ?? 0.0)
        }
        
        let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        ExpressionParser.componentsByOperators(from: str).map{
            operators.enqueue(Operator(rawValue: $0) ?? .add)
        }
        // when
        let formula = Formula(operands: operands, operators: operators)
        
        let result = formula.operands.peekFirst
                
        // then
        XCTAssertEqual(result, expectation)
    }
}
