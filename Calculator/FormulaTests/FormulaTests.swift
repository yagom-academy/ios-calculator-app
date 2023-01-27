//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Jinah Park on 2023/01/27.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        sut = Formula
//    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operands에1과2가들어있고operators에더하기가있을경우_result호출시_3을반환한다() {
        //given
        sut = .init(operands: .init([1, 2]), operators: .init([Operator.add]))
        let expectedValue = 3.0
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands에1과2와4이들어있고operators에더하기와빼기가있을경우_result호출시_음수1을반환한다() {
        //given
        sut = .init(operands: .init([1, 2]), operators: .init([Operator.add]))
        let expectedValue = -1.0
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    
}
