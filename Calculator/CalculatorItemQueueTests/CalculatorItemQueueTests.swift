//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enQueue호출시_queue에값이추가된다() {
        // given
        let firstData: Int = 10
        let secondData: Int = 20
        let thirdData: Int = 30
        
        // when
        sut.enQueue(firstData)
        sut.enQueue(secondData)
        sut.enQueue(thirdData)
        
        // then
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.front, firstData)
        XCTAssertEqual(sut.rear, thirdData)
    }
    
    func test_deQueue호출시_front값이삭제된다() {
        // given
        let firstData: Int = 10
        let secondData: Int = 20
        let thirdData: Int = 30
        sut.enQueue(firstData)
        sut.enQueue(secondData)
        sut.enQueue(thirdData)
        
        // when
        sut.deQueue()
        
        // then
        XCTAssertEqual(sut.front, secondData)
        XCTAssertEqual(sut.rear, thirdData)
    }
    
    func test_deQueue호출시_isEmpty일때_nil반환한다() {
        // given
        
        // when
        let result = sut.deQueue()
        
        // then
        XCTAssertNil(result)
    }
}

extension Int: CalculatorItem {
    
}
