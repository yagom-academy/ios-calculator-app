//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Baem on 2022/09/24.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .add
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
    
    func test_subtract일_때_calculates실행시_두개의_값을_빼주고_반환하는지() {
        sut = .subtract
        
        //given
        let lhs = 13.2
        let rhs = 12.2
        
        //when
        let result = sut?.calculates(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_divide일_때_calculates실행시_두개의_값을_나누고_반환하는지() {
        sut = .divide
        
        //given
        let lhs = 13.2
        let rhs = 12.2
        
        //when
        let result = sut?.calculates(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 13.2/12.2)
    }
    
    func test_multiply일_때_calculates실행시_두개의_값을_곱하고_반환하는지() {
        sut = .multiply
        
        //given
        let lhs = 13.2
        let rhs = 12.2
        
        //when
        let result = sut?.calculates(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 161.04)
    }
}
