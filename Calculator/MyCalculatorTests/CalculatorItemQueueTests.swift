//
//  CalculatorItemQueueTests.swift
//  MyCalculatorTests
//
//  Created by yeton on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_처음_enqueue메서드를호출해_값을전달했을때_head의data에_값이제대로들어가있다() {
        // give
        let input = 3.0
        
        // when
        sut?.enqueue(data: input)
        
        // then
        XCTAssertEqual(sut?.queue.head?.data, 3.0)
    }
    
    func test_enqueue로_값을넣고_dequeue를하면_dequeue의반환값이_잘나온다() {
        // give
        sut?.enqueue(data: 3.0)
        sut?.enqueue(data: 4.0)
        
        // when
        let result = sut?.dequeue()!
        
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_enqueue로_여러값을넣고_dequeue를한번했을때_linkedList의count가_올바르게나온다() {
        // give
        sut?.enqueue(data: 3.0)
        sut?.enqueue(data: 4.0)
        sut?.enqueue(data: 5.0)
        
        // when
        sut?.dequeue()
        let count = sut?.queue.count
        
        // then
        XCTAssertEqual(count, 2)
    }
    
    func test_enqueue로_여러값을넣고_dequeueAll을했을때_linkedList의count가_0이나온다() {
        // give
        sut?.enqueue(data: 3.0)
        sut?.enqueue(data: 4.0)
        
        // when
        sut?.removeAll()
        let result = sut?.queue.count
        
        // then
        XCTAssertEqual(result, 0)
    }
}

