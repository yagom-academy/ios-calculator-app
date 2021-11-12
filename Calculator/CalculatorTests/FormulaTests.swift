//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/12.
//

import XCTest

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
    
    func test_연산자_1개_숫자_2개가_있을_경우_계산이_잘_되는지() {
        sut.operands.appendItem(1)
        sut.operands.appendItem(2)
        sut.operators.appendItem(.add)
        
        XCTAssertEqual(try sut.result(), 3)
    }
}
