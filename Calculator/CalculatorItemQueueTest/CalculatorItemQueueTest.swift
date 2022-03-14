//
//  CalculatorItemQueueTest.swift
//  LinkedListTest
//
//  Created by DuDu on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - isEmpty 함수 테스트
    func test_큐가_비어있을때_isEmpty가_true인지() {
        //given, when, then
        XCTAssertTrue(sut.isEmpty)
    }
}
