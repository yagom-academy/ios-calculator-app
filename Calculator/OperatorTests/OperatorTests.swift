//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Jinah Park on 2023/01/27.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Operator가add이고0과1이주어졌을때_calculate호출시_1을반환한다() throws {
        //given
        let lhs = 0.0
        let rhs = 1.0
        sut = Operator.add
        let expectedValue = lhs + rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가subtract이고0과1이주어졌을때_calculate호출시_음수1을반환한다() throws {
        //given
        let lhs = 0.0
        let rhs = 1.0
        sut = Operator.subtract
        let expectedValue = lhs - rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가subtract이고1과0이주어졌을때_calculate호출시_1을반환한다() throws {
        //given
        let lhs = 1.0
        let rhs = 0.0
        sut = Operator.subtract
        let expectedValue = lhs - rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가subtract이고1과1이주어졌을때_calculate호출시_0을반환한다() throws {
        //given
        let lhs = 1.0
        let rhs = 1.0
        sut = Operator.subtract
        let expectedValue = lhs - rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가devide이고3과1이주어졌을때_calculate호출시_3을반환한다() throws {
        //given
        let lhs = 3.0
        let rhs = 1.0
        sut = Operator.devide
        let expectedValue = lhs/rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가devide이고1과3이주어졌을때_calculate호출시_3분지1을반환한다() throws {
        //given
        let lhs = 1.0
        let rhs = 3.0
        sut = Operator.devide
        let expectedValue = lhs/rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가devide이고0과3이주어졌을때_calculate호출시_0을반환한다() throws {
        //given
        let lhs = 0.0
        let rhs = 3.0
        sut = Operator.devide
        let expectedValue = lhs/rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가devide이고3과0이주어졌을때_calculate호출시_에러를던진다() throws {
        //given
        let lhs = 3.0
        let rhs = 0.0
        sut = Operator.devide
        //when
        if rhs == 0.0 {
            //then
            XCTAssertThrowsError(try sut.calculate(lhs: lhs, rhs: rhs))
        }
    }
    
    func test_Operator가multiply이고0과3이주어졌을때_calculate호출시_0을반환한다() throws {
        //given
        let lhs = 0.0
        let rhs = 3.0
        sut = Operator.multiply
        let expectedValue = lhs * rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가multiply이고1과1이주어졌을때_calculate호출시_1을반환한다() throws {
        //given
        let lhs = 1.0
        let rhs = 1.0
        sut = Operator.multiply
        let expectedValue = lhs * rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가multiply이고1과3이주어졌을때_calculate호출시_3을반환한다() throws {
        //given
        let lhs = 1.0
        let rhs = 3.0
        sut = Operator.multiply
        let expectedValue = lhs * rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가multiply이고1과음수3이주어졌을때_calculate호출시_음수3을반환한다() throws {
        //given
        let lhs = 1.0
        let rhs = -3.0
        sut = Operator.multiply
        let expectedValue = lhs * rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가multiply이고음수1과3이주어졌을때_calculate호출시_음수3을반환한다() throws {
        //given
        let lhs = -1.0
        let rhs = 3.0
        sut = Operator.multiply
        let expectedValue = lhs * rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_Operator가multiply이고음수1과음수3이주어졌을때_calculate호출시_3을반환한다() throws {
        //given
        let lhs = -1.0
        let rhs = -3.0
        sut = Operator.multiply
        let expectedValue = lhs * rhs
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        //then
        XCTAssertEqual(expectedValue, result)
    }
}
