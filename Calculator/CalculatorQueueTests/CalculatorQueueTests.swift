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
    func test_enqueueItem에_숫자값이_입력될_경우_queue에_순서대로_담긴다(){
        
        sut.enqueueItem(2)
        sut.enqueueItem(3)
        sut.enqueueItem(7)
        
        let result = sut.queue
        
        let expectation = [2,3,7]
        
        XCTAssertEqual(result, expectation)
    }
    
    // dequeueItem test
    func test_dequeueItem는_queue에담긴_첫번째값을_빼낸다() {
        
        sut.enqueueItem(4)
        sut.enqueueItem(5)
        sut.enqueueItem(9)

        sut.dequeueItem()
        
        let result = sut.queue
        let expection = [5,9]
        
        XCTAssertEqual(result,expection)
    }
    
    func test_queue에_값이없을경우_dequeueItem은_nil을_반환한다() {
        
        XCTAssertNil(sut.dequeueItem())
    }
}
