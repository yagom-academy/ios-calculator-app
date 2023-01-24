//
//  CalculatorQueueTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/25.
//

import XCTest

final class CalculatorQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    // enqueueItem test
    func test_enqueueItem에_숫자값이_입력될_경우_queue에_추가된다(){
        
        sut.enqueueItem(2)
        sut.enqueueItem(3)
        sut.enqueueItem(7)
        
        let result = sut.queue
        
        let expectation = [2,3,7]
        
        XCTAssertEqual(result, expectation)
    }
    // dequeueItem test
    func test_dequeueItem() {
        
    }
}
