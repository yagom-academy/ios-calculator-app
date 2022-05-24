//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이원빈 on 2022/05/24.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(stack: []),
                      operators: CalculatorItemQueue<Character>(stack: []))
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operands_operators에_최소갯수가_만족되지않을때_notEnoughInput에러를던지는지() {
        //given
        sut.operands.enqueue(2)
        sut.operators.enqueue("+")
        
        let expectation = FormulaError.notEnoughInput
        //when
        //then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(expectation, error as? FormulaError)
        }
    }
    
    func test_더하기() {
        //given
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        sut.operators.enqueue("+")
        
        let expectation = Double(3)
        //when
        let result = try! sut.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_음수더하기() {
        //given
        sut.operands.enqueue(-1)
        sut.operands.enqueue(-2)
        sut.operators.enqueue("+")
        
        let expectation = Double(-3)
        //when
        let result = try! sut.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_빼기() {
        //given
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        
        sut.operators.enqueue("-")
        
        let expectation = Double(-1)
        //when
        let result = try! sut.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_나누기() {
        //given
        sut.operands.enqueue(27)
        sut.operands.enqueue(3)
        
        sut.operators.enqueue("÷")
        
        let expectation = Double(9)
        //when
        let result = try! sut.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_곱하기() {
        //given
        sut.operands.enqueue(3)
        sut.operands.enqueue(9)
        
        sut.operators.enqueue("×")
        
        let expectation = Double(27)
        //when
        let result = try! sut.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_나누기0이들어갔을때_dividedZeroError를던지는지() {
        //given
        sut.operands.enqueue(27)
        sut.operands.enqueue(13)
        sut.operands.enqueue(0)
        
        sut.operators.enqueue("+")
        sut.operators.enqueue("÷")
        let expectation = OperatorError.dividedByZero
        //when
        //Then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(expectation, error as? OperatorError)
        }
    }
}
