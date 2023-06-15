//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 박종화 on 2023/06/14.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_operands스택에_1과2를넣고_operators스택에_더하기를넣으면_result값이3이되는지() {
        // given
        let input: Double = 1
        let input2: Double = 2
        let input3: Operator = .add
        let expectation: Double = 3
        
        sut.operands.enqueue(input)
        sut.operands.enqueue(input2)
        sut.operators.enqueue(input3)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operands스택에_아무런피연산자가없으면_더하기를했을때_result값이0이되는지() {
        // given
        let expecation: Double = 0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expecation)
    }
    
    func test_operands스택에_3을넣고_operators스택에는_연산자가없을때_result값이3이되는지() {
        // given
        let input: Double = 3
        let expeactation: Double = 3
        
        sut.operands.enqueue(input)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expeactation)
    }
    
    func test_peek값이_enqueueStack에1을넣었을ㄸ() {
        // given
        let input: Double = 30
        let input2: Operator = .add
        let expectation: Double = 30
        
        sut.operands.enqueue(input)
        sut.operators.enqueue(input2)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
