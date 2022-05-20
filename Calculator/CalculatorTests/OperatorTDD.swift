//
//  OperatorTDD.swift
//  CalculatorTests
//
//  Created by LeeChiheon on 2022/05/20.
//

import XCTest

class OperatorTDD: XCTestCase {
    // TODO: Operator 열거형이 연산자로써의 역할을 잘 수행하는지 확인
    var operatorEnum: Operator!
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        operatorEnum = nil
    }

    // MARK: - Operator Tests
    
    func test_더하기() throws {
        // given
        let leftOperands: Double = 5.0
        let rightOperands: Double = 4.0
        let expectation: Double = 9.0
        
        // when
        operatorEnum = .init(rawValue: "+")
        
        // then
        XCTAssertEqual(operatorEnum.calculate(lhs: leftOperands, rhs: rightOperands), expectation)
    }
    
    func test_빼기() throws {
        // given
        let leftOperands: Double = 5.0
        let rightOperands: Double = 4.0
        let expectation: Double = 1.0
        
        // when
        operatorEnum = .init(rawValue: "-")
        
        // then
        XCTAssertEqual(operatorEnum.calculate(lhs: leftOperands, rhs: rightOperands), expectation)
    }
    
    func test_나누기() throws {
        // given
        let leftOperands: Double = 30.0
        let rightOperands: Double = 6.0
        let expectation: Double = 5.0
        
        // when
        operatorEnum = .init(rawValue: "/")
        
        // then
        XCTAssertEqual(operatorEnum.calculate(lhs: leftOperands, rhs: rightOperands), expectation)
    }
    
    func test_곱하기() throws {
        // given
        let leftOperands: Double = 5.0
        let rightOperands: Double = 4.0
        let expectation: Double = 20.0
        
        // when
        operatorEnum = .init(rawValue: "*")
        
        // then
        XCTAssertEqual(operatorEnum.calculate(lhs: leftOperands, rhs: rightOperands), expectation)
    }

}
