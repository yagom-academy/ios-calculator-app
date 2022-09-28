//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 서현웅 on 2022/09/28.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {

    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_result_호출시_2항연산_계산결과가나오는지() {
        // given
        sut.operands.enqueue(10.0)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(2.0)
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, 20.0)
        
    }

}
