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
    func test_4에서9를뺐을때마이너스5가나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: 4.0, rhs: 9.0)
        //then
        XCTAssertEqual(result, -5.0)
    }
    func test_4에서마이너스9를뺐을때13이나오는지() {
        //given
        sut = Operator.subtract
        //when
        let result = sut.calculate(lhs: 4.0, rhs: -9.0)
        //then
        XCTAssertEqual(result, 13.0)
    }
}
