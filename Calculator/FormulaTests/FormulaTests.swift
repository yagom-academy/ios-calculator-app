//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by NAMU on 2022/05/19.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result_값이_정상일때_더하기_연산결과를_출력하는지() {
        // given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 3.0)
        
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .add)
        
        // when
        let result = 6.0
        
        // then
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_result_값이_정상일때_빼기_연산결과를_출력하는지() {
        // given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 3.0)
        
        sut.operators.enqueue(data: .subtract)
        sut.operators.enqueue(data: .add)
        
        // when
        let result = 2.0
        
        // then
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_result_값이_정상일때_곱하기_연산결과를_출력하는지() {
        // given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 3.0)
        
        sut.operators.enqueue(data: .multiply)
        sut.operators.enqueue(data: .add)
        
        // when
        let result = 5.0
        
        // then
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_result_값이_나누기_연산결과를_출력하는지() {
        // given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 1.0)
        
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .divide)
        
        // when
        let result = 3.0
        
        // then
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_result_0으로나눴을때_무한대를_출력하는지() throws {
        // given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 0.0)
        
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .divide)
        
        // then
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_result_숫자가_1개들어오면_제대로반환하는지() {
        // given
        sut.operands.enqueue(data: 1.0)
        
        // when
        let result = 1.0
        
        // then
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_result_숫자보다_연산자의수가_많으면_가능값들을연산해서_정상적인_결과를반환하는지() {
        // given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .multiply)
        
        // when
        let result = 3.0
        
        // then
        XCTAssertEqual(result, try sut.result())
    }
}
