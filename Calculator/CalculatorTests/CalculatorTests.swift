//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by mint on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue2번시_count가_2인지() {
        //given
        let input = 1
        let input2 = 2
        
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
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
    
    func test_isEmpty_true인지() {
        //given
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_false일때_count가_0이아닌지() {
        //given
        let input = 10
        
        //when
        sut.enqueue(input)
        let result = sut.isEmpty
        let count = sut.count
        
        //then
        XCTAssertFalse(result)
        XCTAssertEqual(count, 1)
    }
    
    func test_dequeue_enqueue1과2실행시_dequeue1번_결과가_1인지() {
        //given
        let input = 1
        let input2 = 2
        
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_dequeue_enqueue된게없을때_nil반환하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_dequeue_enqueue는_1번인데_dequeue는_2번일때_1번과nil이_반환되는지() {
        //given
        let input = 10
        
        //when
        sut.enqueue(input)
        let result = sut.dequeue()
        let result2 = sut.dequeue()
        
        //then
        XCTAssertEqual(result, input)
        XCTAssertEqual(result2, nil)
    }
    
    func test_enqueue3번후_dequeue1번시_count가_2로나오는지() {
        //given
        let input = 1
        let input2 = 2
        let input3 = 3
        
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        let answer = sut.dequeue()
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
        XCTAssertEqual(answer, 1)
    }
    
    func test_enqueue10과20으로두번후_dequeue한번하고_다시endqueue30한후_dequeue두번시_dequeue는_10다음_20다음_30인지() {
        //given
        let input = 10
        let input2 = 20
        let input3 = 30

        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        let result = sut.dequeue()
        sut.enqueue(input3)
        let result2 = sut.dequeue()
        let result3 = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 10)
        XCTAssertEqual(result2, 20)
        XCTAssertEqual(result3, 30)
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
    
    func test_first_enqueue_1과2와3실행하고_dequeue1번시_first가_2인지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let answer = sut.dequeue()
        
        //when
        let result = sut.first
        
        //then
        XCTAssertEqual(result, 2)
        XCTAssertEqual(answer, 1)
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
        let input = 10
        let input2 = 20
        
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        let result = sut.dequeue()
        let first = sut.first
        let last = sut.last
        
        //then
        XCTAssertEqual(first, last)
        XCTAssertEqual(result, 10)
    }
    
    func test_clear_enqueue2번후_clear시_isEmpty가_true인지() {
        //given
        let input = 10
        let input2 = 20
        
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.clear()
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_clear_enqueue1번_dequeue1번후_clear시_isEmpty가_true인지() {
        //given
        let input = 10
        
        //when
        sut.enqueue(input)
        let dequeue = sut.dequeue()
        sut.clear()
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
        XCTAssertEqual(dequeue, 10)
    }
    
    func test_clear_enqueue2번_dequeue1번_다시enqueue1번후_clear시_isEmpty가_true인지() {
        //given
        let input = 10
        let input2 = 20
        let input3 = 30
        
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        let dequeue = sut.dequeue()
        sut.enqueue(input3)
        sut.clear()
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
        XCTAssertEqual(dequeue, 10)
    }
}
