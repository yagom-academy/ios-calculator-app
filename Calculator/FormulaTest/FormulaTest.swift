//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 최최성균 on 2022/03/18.
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

    //MARK: - result()
    func test_result호출시_2와3과plus가있을때_5를반환하는지() {
        //given
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operations.enqueue(.add)
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, 5)
    }
}
