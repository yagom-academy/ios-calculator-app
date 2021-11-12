//
//  CalculatorItemQueueDoubleTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/11.
//

import XCTest

class CalculatorItemQueueDoubleTests: XCTestCase {
    
    var sutQueue: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        sutQueue = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sutQueue = nil
    }
    
    func test_빈_큐에_Double_타입_10을_enqueue하고_한번_dequeue하면_부동_소수점_10을_반환하는가() {
        // given
        sutQueue.enqueue(10.0)
        // when
        let result = sutQueue.dequeue()
        // then
        XCTAssertEqual(result, 10.0)
    }
}

extension Double: CalculateItem { }
