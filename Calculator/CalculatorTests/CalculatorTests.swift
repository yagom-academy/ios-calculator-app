//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by junho lee on 2022/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: Calculator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_플러스를_inputOperator하면_currentOperator가_플러스인지() {
        // given
        sut.inputOperator("+")
        
        // when
        let result: String = sut.currentOperator
        
        // then
        XCTAssertEqual(result, "+")
    }
    
    func test_마이너스1234포인트56를순서대로_inputOperand하면_currentOperand가_마이너스1콤마234포인트56인지() {
        // given
        let input: String = "-1234.56"
        input.forEach {
            sut.inputOperand(String($0))
        }
        
        // when
        let result: String = sut.currentOperand
        
        // then
        XCTAssertEqual(result, "-1,234.56")
    }
    
    func test_123을순서대로_inputOperand하고_switchPositiveNegativeOfCurrentOperand하면_currentOpernad가_마이너스123인지() {
        // given
        let input: String = "123"
        input.forEach {
            sut.inputOperand(String($0))
        }
        sut.switchPositiveNegativeOfCurrentOperand()
        
        // when
        let result: String = sut.currentOperand
        
        // then
        XCTAssertEqual(result, "-123")
    }
}
