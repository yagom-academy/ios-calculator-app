//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by junho lee on 2022/09/23.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add일때_calculate에_1과2를전달하면_3을반환하는지() {
        // given
        sut = .add
        
        // when
        let result: Double = try! sut.calculate(lhs: 1, rhs: 2)
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_subtract일때_calculate에_2와1을전달하면_1을반환하는지() {
        // given
        sut = .subtract
        
        // when
        let result: Double = try! sut.calculate(lhs: 2, rhs: 1)
                
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_divide일때_calculate에_4와2를전달하면_2를반환하는지() {
        // given
        sut = .divide
        
        // when
        let result: Double = try! sut.calculate(lhs: 4, rhs: 2)
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_divide일때_calculate에_2와0을전달하면_dividedByZero오류를반환하는지() {
        // given
        sut = .divide
        
        // when
        do {
            _ = try sut.calculate(lhs: 2, rhs: 0)
        } catch {
            // then
            XCTAssertEqual(CalculateError.dividedByZero, error as! CalculateError)
        }
    }
    
    func test_multiply일때_calculate에_2와3을전달하면_6을반환하는지() {
        // given
        sut = .multiply
        
        // when
        let result: Double = try! sut.calculate(lhs: 2, rhs: 3)
        
        // then
        XCTAssertEqual(result, 6)
    }
}
