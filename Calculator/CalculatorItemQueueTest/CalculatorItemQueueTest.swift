//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by Kiwon Song on 2022/05/17.
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
    
    func test_리스트_초기화_후_isEmpty값이_true여야한다() {
        //given
        let sut = Linkedlist<Int>()
        //when,then
        XCTAssertTrue(sut.isEmpty)
    }

}
