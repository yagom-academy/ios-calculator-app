//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/15.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {

    func test_영점일_더하기_영점이_계산하면_영점삼을_반환한다() {
        let result = Operator.add.calculate(lhs: 0.1, rhs: 0.2)
        
        XCTAssertEqual(Decimal(result), 0.3)
    }
    
    func test_일_더하기_이_계산하면_삼을_반환한다() {
        let result = Operator.add.calculate(lhs: 1.0, rhs: 2.0)
        
        XCTAssertEqual(Decimal(result), 3.0)
    }
    
    func test_영점삼사삼오_더하기_마이너스일점이_계산하면_삼을_반환한다() {
        let result = Operator.add.calculate(lhs: 0.3435, rhs: -1.2)
        
        XCTAssertEqual(Decimal(result), -0.8565)
    }
    
    func test_일_빼기_이_계산하면_삼을_반환한다() {
        let result = Operator.substract.calculate(lhs: 1.0, rhs: 2.0)
        
        XCTAssertEqual(Decimal(result), -1.0)
    }
    
    func test_일_곱하기_이_계산하면_삼을_반환한다() {
        let result = Operator.multiply.calculate(lhs: 1.0, rhs: 2.0)
        
        XCTAssertEqual(Decimal(result), 2.0)
    }
    
    func test_마이너스일_곱하기_이_계산하면_삼을_반환한다() {
        let result = Operator.multiply.calculate(lhs: -1.0, rhs: 2.0)
        
        XCTAssertEqual(Decimal(result), -2.0)
    }
    
    func test_마이너스일_나누기_이_계산하면_삼을_반환한다() {
        let result = Operator.divide.calculate(lhs: -1.0, rhs: 0.0)
        
        XCTAssertEqual(Decimal(result).isNaN, true)
    }
}
