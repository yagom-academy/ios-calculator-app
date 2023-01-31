//  FormulaTest.swift
//  Created by 레옹아범 on 2023/01/27.

import XCTest
@testable import Calculator

final class FormulaTest: XCTestCase {
    
    var sut: Formula!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_1과_2를_더하면_result의_값은_3이다() {
        // given
        let operands: [Double] = [1, 2]
        let operators: [Operator] = [.add]
        
        sut = Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
        
        let exception = 3.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_2더하기3곱하기3빼기1의_result값은_14이다() {
        // given
        let operands: [Double] = [2, 3, 3, 1]
        let operators: [Operator] = [.add, .multiply, .subtract]
        
        sut = Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
        
        let exception = 14.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, exception)
    }
}
