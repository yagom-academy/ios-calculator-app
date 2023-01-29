//
//  FormularTests.swift
//  FormularTests
//
//  Created by 혜모리 on 2023/01/29.
//

import XCTest
@testable import Calculator

final class FormularTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_모든큐가비어있을때_result호출시_연산결과는0이다() {
        // given
        let expectation: Double = 0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_result호출시_다음의연산결과는_724이다() {
        // 1000 + 30 * 2 / 2.5 - 10.8 + -89.2
        
        // given
        let expectation: Double = 724
        
        sut.operands.enqueue(1000)
        sut.operands.enqueue(30)
        sut.operands.enqueue(2)
        sut.operands.enqueue(2.5)
        sut.operands.enqueue(10.8)
        sut.operands.enqueue(-89.2)
        
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.subtract)
        sut.operators.enqueue(.add)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_0으로나누는것이_연산에포함되어있을때_결과는NaN이다() {
        // 2 * 1000 / 0 + 1
        
        // given
        sut.operands.enqueue(2)
        sut.operands.enqueue(1000)
        sut.operands.enqueue(0)
        sut.operands.enqueue(1)
        
        sut.operators.enqueue(.multiply)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.add)
        
        // when
        let result = sut.result()
        print(result)
        
        // then
        XCTAssertTrue(result.isNaN)
    }
}
