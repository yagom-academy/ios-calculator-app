//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<CalculateItem>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<CalculateItem>()

    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil

    }
    
    func test_not_enqueue_isEmpty_return_true() {
        // given
        

        // when
        let reselt = sut.isEmpty()

        // then
        XCTAssertTrue(reselt)
        
    }
    
    func test_once_enqueue_isEmpty_return_false() {
        // given
        sut.enqueue(0)

        // when
        let reselt = sut.isEmpty()

        // then
        XCTAssertFalse(reselt)
        
    }
    
    func test_not_enqueue_count_return_zero() {
        // given
        

        // when
        let reselt = sut.count()

        // then
        XCTAssertEqual(reselt, 0)
    }
    
    func test_count_3_data_enqueue_count_return_3() {
        // given
        sut.enqueue(0)
        sut.enqueue(1)
        sut.enqueue(2)

        // when
        let reselt = sut.count()

        // then
        XCTAssertEqual(reselt, 3)
    }
    
    func test_data_1_dequeue_retrun_1() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)

        // when
        guard let reselt = sut.dequeue() as? Int else { return }

        // then
        XCTAssertEqual(reselt, 1)
    }
    
    func test_not_enqueue_dequeue_return_nil() {
        // given


        // when
        guard let reselt = sut.dequeue() as? Int else { return }

        // then
        XCTAssertEqual(reselt, nil)
    }
    
    func test_data_1_dequeue_count_retrun_0() {
        // given
        sut.enqueue(1)
        sut.dequeue()

        // when
        let reselt = sut.count()

        // then
        XCTAssertEqual(reselt, 0)
    }
}
