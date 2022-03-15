//
//  QueueTests.swift
//  QueueTests
//
//  Created by 김동욱 on 2022/03/15.
//

import XCTest
@testable import Calculator

extension Double: CalculateItem {
}

class QueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enQueue큐_배열에_값이_추가가_되는지() {
        let calculateItem = 0.33
        sut.enQueue(element: calculateItem)
        XCTAssertNotNil(sut.queue.isEmpty)
    }
    
    func test_queue() {
        //given
        
        //when
        
        //then
    }
}
