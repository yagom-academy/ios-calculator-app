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
        let operators: [Operator] = [.add]
        let operands: [Double] = [1, 2]
        let exception: Double = 3
        sut = Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, exception)
    }
}
