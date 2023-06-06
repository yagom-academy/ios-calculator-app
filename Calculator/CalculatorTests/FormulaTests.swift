//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by minsong kim on 2023/06/06.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기2일때_결과값이_3인지() {
        //given
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_1더하기2더하기3빼기3일때_결과값이_3인지() {
        //given
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 3)
    }
}
