//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Yena on 2023/06/03.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
//    func test_first_초기화로_head에_data_1를넣고_first를호출하면_first는_1이다() {
//        // given
//        sut = LinkedList(head: Node(data: 1))
//        let expectation = 1.0
//
//        //when
//        let result = sut.first as! Double
//
//        // then
//        XCTAssertEqual(result, expectation)
//    }

    func test_result_operands에_값이없으면_result는0이다() {
        // given
        let expectation = 0.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_enqueue하면_result는1이다() {
        // given
        sut.operands.enqueue(1.0)
        let expectation = 1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_2_enqueue하고_operators에_값이없으면_result는1이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        let expectation = 1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_2_enqueue하고_operators에_더하기_enqueue하면_result는3이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.add)
        let expectation = 3.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_2_3_enqueue하고_operators에_더하기_enqueue하면_result는3이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(.add)
        let expectation = 3.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_2_enqueue하고_operators에_빼기_enqueue하면_result는음수1이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.subtract)
        let expectation = -1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_4_2_enqueue하고_operators에_빼기_enqueue하면_result는2이다() {
        // given
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.subtract)
        let expectation = 2.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_2_3_enqueue하고_operators에_빼기_enqueue하면_result는음수1이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(.subtract)
        let expectation = -1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_1_2_enqueue하고_operators에_곱하기_enqueue하면_result는2이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.multiply)
        let expectation = 2.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_2_3_4_enqueue하고_operators에_곱하기_enqueue하면_result는6이다() {
        // given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operators.enqueue(.multiply)
        let expectation = 6.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_4_2_enqueue하고_operators에_나누기_enqueue하면_result는2이다() {
        // given
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.divide)
        let expectation = 2.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_operands에_10_4_1_enqueue하고_operators에_나누기_enqueue하면_result는2쩜5이다() {
        // given
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(.divide)
        let expectation = 2.5
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }

}
