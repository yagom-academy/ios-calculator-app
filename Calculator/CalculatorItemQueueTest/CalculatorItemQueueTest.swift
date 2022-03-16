//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by DuDu on 2022/03/16.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Int>?

    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_초기화후_isEmpty가_true여야한다() {
        //given
        let sut = CalculatorItemQueue<Int>()
        
        //when, then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_초기화후_1을_enqueue하면_isEmpty가_false여야한다() {
        //given
        var sut = CalculatorItemQueue<Int>()
        sut.enqueue(1)
        
        //when
        XCTAssertFalse(sut.isEmpty)
    }
}
