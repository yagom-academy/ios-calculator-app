//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Gordon Choi on 2022/05/19.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_calculate에_1과2를_넣고_더해줬을때_3반환() {
        // when
        let result = sut.calculate(lhs: 1.0, rhs: 2.0)
        
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_calculate에_2와1을_넣고_빼줬을때_1반환() {
        // given
        sut = .subtract
        
        // when
        let result = sut.calculate(lhs: 2.0, rhs: 1.0)
        
        // then
        XCTAssertEqual(result, 1.0)
    }
}
