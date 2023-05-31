//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by mint on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue2번수행시_count가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_count_enqueue없을때_count가_0인지() {
        //given
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_enqueue없을때_isEmpty_true인지() {
        //given
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_false일때_count가_0이아닌지() {
        //given
        sut.enqueue(10)
        
        //when
        let result = sut.isEmpty
        let count = sut.count
        
        //then
        XCTAssertFalse(result)
        XCTAssertEqual(count, 1)
    }
    
    func test_dequeue_enqueue1과2실행시_dequeue1번_결과가_1인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue_enqueue된게없을때_nil반환하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_enqueue는_1번인데_dequeue는_2번일때_2번째에nil이_반환되는지() {
        //given
        sut.enqueue(10)
        let _ = sut.dequeue()
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_enqueue3번후_dequeue1번시_count가_2로나오는지() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)
        let _ = sut.dequeue()
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_first_enqueue_1과2로했을때_first가_1인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.first
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_first_enqueue1과2와3실행하고_dequeue1번시_first가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let _ = sut.dequeue()
        
        //when
        let result = sut.first
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_last_enqueue_1과2실행시_last가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.last
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_last_enqueue2번후_dequeue1번하면_first와_last가_같은지() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        let _ = sut.dequeue()
        
        //when
        let first = sut.first
        let last = sut.last
        
        //then
        XCTAssertEqual(first, last)
    }
    
    func test_clear_enqueue2번후_clear시_isEmpty가_true인지() {
        //given
        sut.enqueue(10)
        sut.enqueue(20)
        sut.clear()
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_clear_비어있는queue에_clear시_isEmpty가_true인지() {
        //given
        sut.clear()
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_clear_enqueue_dequeue후_clear시_isEmpty가_true인지() {
        //given
        sut.enqueue(10)
        let _ = sut.dequeue()
        sut.clear()
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_clear_enqueue_dequeue_enqueue후_clear시_isEmpty가_true인지() {
        //given
        sut.enqueue(10)
        let _ = sut.dequeue()
        sut.enqueue(20)
        sut.clear()
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
}
