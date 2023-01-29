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
    
    func test_operands에1과2가들어있고operators에더하기가있을경우_result호출시_3을반환한다() throws {
        //given
        sut = .init(operands: .init([1.0, 2.0]), operators: .init([Operator.add]))
        let expectedValue = 3.0
        //when
        let result = try sut.result()
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands에1과2와4이들어있고operators에더하기와빼기가있을경우_result호출시_음수1을반환한다() throws {
        //given
        sut = .init(operands: .init([1.0, 2.0, 4.0]), operators: .init([Operator.add, Operator.subtract]))
        let expectedValue = -1.0
        //when
        let result = try sut.result()
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_operands가비어있고operators에더하기가있을경우_result호출시_에러를던진다() throws {
        //given
        sut = .init(operands: .init(), operators: .init([Operator.add]))
        //then
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_operands에1과2가들어있고operators에더하기와빼기가있을경우_result호출시_에러를던진다() throws {
        //given
        sut = .init(operands: .init([1.0, 2.0]), operators: .init([Operator.add, Operator.subtract]))
        //then
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_operands에3과0과2가들어있고operators에나누기와더하기가있을경우_result호출시_에러를던진다() throws {
        //given
        sut = .init(operands: .init([3.0, 0.0, 2.0]), operators: .init([Operator.devide, Operator.add]))
        //then
        XCTAssertThrowsError(try sut.result())
    }
}
