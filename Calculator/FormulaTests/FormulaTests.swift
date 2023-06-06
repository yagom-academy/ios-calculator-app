//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Daehoon Lee on 2023/06/06.
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
    
    func test_init_Double타입Queue로_operands가초기화되면빈상태로원소를꺼내면_nil을반환한다() {
        // given
        let expectedOperandsQueue: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        // when
        sut.operands = expectedOperandsItem
        let result: Double? = sut.operands.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
}
