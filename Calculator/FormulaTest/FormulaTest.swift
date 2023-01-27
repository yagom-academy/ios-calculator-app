//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 강민수 on 2023/01/27.
//

import XCTest
@testable import Calculator

final class FormulaTest: XCTestCase {
    
    var sut: Formula!
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        operands.removeAll()
        operators.removeAll()
        sut = nil
    }
    
    func test_1과_2를_더하면_result의_값은_3이다() {
        // given
        self.operands.enqueue(1)
        self.operands.enqueue(2)
        self.operators.enqueue(.add)
        let exception = 3.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_2와_1을_빼면_result의_값은_1이다() {
        // given
        self.operands.enqueue(2)
        self.operands.enqueue(1)
        self.operators.enqueue(.subtract)
        let exception = 1.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }

}
