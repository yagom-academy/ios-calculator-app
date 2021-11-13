//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/13.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK:- Test add
    func test_add호출시_lhs와_rhs의_합을_반환한다() {
        let lhs = 11.00
        let rhs = 9.99
        let sum = Operator.add.add(lhs: lhs , rhs: rhs)
        
        XCTAssertEqual(sum, lhs + rhs)
    }
    
    // MARK:- Test subtract
    func test_subtract호출시_lhs_빼기_rhs를_반환한다() {
        let lhs = 30.0
        let rhs = 10.0
        let result = Operator.subtract.subtract(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs - rhs)
    }
    
    func test_rhs가_음수일때_subract호출시_lhs와_rhs의_합을_반환한다() {
        let lhs = 5000.0
        let rhs = -555.5
        let result = Operator.subtract.subtract(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs - rhs)
    }
    
    // MARK:- Test divide
    func test_divide호출시_1hs를_2hs로_나눈몫을_반환한다() {
        let lhs = 100.00
        let rhs = 2.0
  
        XCTAssertEqual(try Operator.divide.divide(lhs: lhs, rhs: rhs), lhs/rhs)
    }
    
    func test_rhs가_0일때_divide호출시_계산오류를_반환한다() {
        let lhs = 12345.6789
        let rhs = 0.0
        
        XCTAssertThrowsError(try Operator.divide.divide(lhs: lhs, rhs: rhs)) { error in XCTAssertEqual(error as? CalculatorError, .incomputableDivdie) }
    }
    
    func test_lhs가_음수일때_divide호출시_1hs를_2hs로_나눈몫을_반환한다() {
        let lhs = -100.0
        let rhs = 2.0
  
        XCTAssertEqual(try Operator.divide.divide(lhs: lhs, rhs: rhs), lhs/rhs)
    }
    
    func test_rhs와_lhs가_음수일때_divide호출시_1hs를_2hs로_나눈몫을_반환한다() {
        let lhs = -100.0
        let rhs = -2.0
  
        XCTAssertEqual(try Operator.divide.divide(lhs: lhs, rhs: rhs), lhs/rhs)
    }
    
    // MARK:- Test multiply
    func test_lhs가_양수이고_rhs도_양수일때_multiply호출시_lhs와_rhs의_곱셈값을_반환한다() {
        let lhs = 33.0
        let rhs = 5.0
        let result = Operator.multiply.multiply(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs * rhs)
    }
    
    func test_lhs가_양수이고_rhs도_음수일때_multiply호출시_lhs와_rhs의_곱셈값을_반환한다() {
        let lhs = 33.0
        let rhs = -5.0
        let result = Operator.multiply.multiply(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs * rhs)
    }
    
    func test_lhs가_음수이고_rhs도_음수일때_multiply호출시_lhs와_rhs의_곱셈값을_반환한다() {
        let lhs = -33.0
        let rhs = -5.0
        let result = Operator.multiply.multiply(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs * rhs)
    }
}
