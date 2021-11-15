//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Jae-hoon Sim on 2021/11/11.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_4와9를더했을때_13이나오는지() {
        //given
        sut = Operator.add
        //when
        let result = sut.calculate(lhs: 4.0, rhs: 9.0)
        //then
        XCTAssertEqual(result, 13.0)
    }
    func test_4와마이너스9를더했을때_마이너스5가나오는지() {
        //given
        sut = Operator.add
        //when
        let result = sut.calculate(lhs: 4.0, rhs: -9.0)
        //then
        XCTAssertEqual(result, -5.0)
    }
    func test_NaN과4를더했을때_NaN이나오는지() {
        //given
        sut = Operator.add
        //when
        let result = sut.calculate(lhs: Double.nan, rhs: 4.0)
        //then
        XCTAssertTrue(result.isNaN)
    }
    func test_4와NaN을더했을때_NaN이나오는지() {
        //given
        sut = Operator.add
        //when
        let result = sut.calculate(lhs: 4.0, rhs: Double.nan)
        //then
        XCTAssertTrue(result.isNaN)
    }
    func test_NaN과NaN을더했을때_NaN이나오는지() {
        //given
        sut = Operator.add
        //when
        let result = sut.calculate(lhs: Double.nan, rhs: Double.nan)
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    
    func test_4에서9를뺐을때_마이너스5가나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: 4.0, rhs: 9.0)
        //then
        XCTAssertEqual(result, -5.0)
    }
    func test_4에서마이너스9를뺐을때_13이나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: 4.0, rhs: -9.0)
        //then
        XCTAssertEqual(result, 13.0)
    }
    func test_9에서NaN을뺐을때_NaN이나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: 9.0, rhs: Double.nan)
        //then
        XCTAssertTrue(result.isNaN)
    }
    func test_NaN에서9를뺐을때_NaN이나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: Double.nan, rhs: 9.0)
        //then
        XCTAssertTrue(result.isNaN)
    }
    func test_NaN에서NaN을뺐을때_NaN이나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: Double.nan, rhs: Double.nan)
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_0에10을곱했을때_0이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 0, rhs: 10)
        //then
        XCTAssertEqual(result, 0.0)
    }
    func test_0에마이너스10을곱했을때_0이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 0.0, rhs: -10.0)
        //then
        XCTAssertEqual(result, 0.0)
    }
    func test_0에0을곱했을때_0이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 0.0, rhs: 0.0)
        //then
        XCTAssertEqual(result, 0.0)
    }
    func test_2에10을곱했을때_20이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 2.0, rhs: 10.0)
        //then
        XCTAssertEqual(result, 20.0)
    }
    func test_2에마이너스10을곱했을때_마이너스20이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 2.0, rhs: -10.0)
        //then
        XCTAssertEqual(result, -20.0)
    }
    func test_2에0을곱했을때_0이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 2.0, rhs: 0.0)
        //then
        XCTAssertEqual(result, 0.0)
    }
    func test_마이너스2에마이너스10을곱했을때_20이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: -2.0, rhs: -10.0)
        //then
        XCTAssertEqual(result, 20.0)
    }
    func test_9에서NaN을곱했을때_NaN이나오는지() {
        //given
        sut = Operator.multiply
        //when
        let result = sut.calculate(lhs: 9.0, rhs: Double.nan)
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_15를2로나누면_7점5가나오는지() {
        //given
        sut = Operator.divide
        //when
        let result = sut.calculate(lhs: 15.0, rhs: 2.0)
        //then
        XCTAssertEqual(result, 7.5)
    }
    func test_15를마이너스2로나누면_마이너스7점5가나오는지() {
        //given
        sut = Operator.divide
        //when
        let result = sut.calculate(lhs: 15.0, rhs: -2.0)
        //then
        XCTAssertEqual(result, -7.5)
    }
    func test_15를0으로나누면_NaN나오는지() {
        //given
        sut = Operator.divide
        //when
        let result = sut.calculate(lhs: 15.0, rhs: 0.0)
        //then
        XCTAssertTrue(result.isNaN)
    }
}
