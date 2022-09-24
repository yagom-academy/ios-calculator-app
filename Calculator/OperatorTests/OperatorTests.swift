//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Dylan_Y on 2022/09/24.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Operator.add
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add일_때_calculates실행시_두개의_값을_더해주고_반환하는지() {
        //given
        let lhs = 11.1
        let rhs = 13.4
        
        //when
        let result = sut?.calculates(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 24.5)
    }
}
