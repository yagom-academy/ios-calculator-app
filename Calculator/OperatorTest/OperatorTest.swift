//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest

final class OperatorTest: XCTestCase {
    
    var sut: Operator!

    override func setUpWithError() throws {
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_add호출시_피연산자가2와5이면_7을반환한다() {
        // given
        let operand1 = 2.0
        let operand2 = 5.0
        sut = Operator.add
        let expectaiton = 7.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
    
    func test_add호출시_피연산자가마이너스2와마이너스5라면_마이너스7을반환한다() {
        // given
        let operand1 = -2.0
        let operand2 = -5.0
        sut = Operator.add
        let expectaiton = -7.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectaiton)
    }

}
