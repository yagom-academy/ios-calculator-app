//
//  OperatorAddTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/12.
//

import XCTest

class OperatorAddTests: XCTestCase {
    var sut: Operator
    override func setUpWithError() throws {
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testCalculate_given10and10_expect20() {
        XCTAssertEqual(sut.calculate(), 20)
    }
}
