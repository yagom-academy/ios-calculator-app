//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by kimseongjun on 2023/01/27.


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
    
    func test_result메서드에서_1더하기23빼기12곱하기2하면_24가나온다() {
        //given
        sut.operands.enqueue(item: 1)
        sut.operands.enqueue(item: 23)
        sut.operands.enqueue(item: 12)
        sut.operands.enqueue(item: 2)
        
        sut.operators.enqueue(item: .add)
        sut.operators.enqueue(item: .subtract)
        sut.operators.enqueue(item: .multiply)
        
        let expectedValue: Double = 24
        //when
        let result = sut.result()
        
        //then
        
        XCTAssertEqual(result, expectedValue)
    }
    
}
