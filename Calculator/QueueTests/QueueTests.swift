//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 전민수 on 2022/05/16.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Double>()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        sut = nil
    }

    func test_enqueue_양의_실수가_순서대로_들어가는지_테스트() throws {
        // given
        let input1: Double = 1
        let input2: Double = 9999
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        
        // when
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        // then
        XCTAssertEqual(result1, input1)
        XCTAssertEqual(result2, input2)
    }


    func test_enqueue_0과_음의실수가_순서대로_들어가는지_테스트() throws {
        // given
        let input1: Double = 0
        let input2: Double = -9999
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        
        // when
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        // then
        XCTAssertEqual(result1, input1)
        XCTAssertEqual(result2, input2)
    }

    func test_enqueue_중복된_실수가_제대로_들어가는지_테스트() throws {
        // given
        let input1 = 1.0
        let input2 = 2.0
        let input3 = 2.0
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        sut.enqueue(element: input3)

        // when
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        let result3 = sut.dequeue()

        // then
        XCTAssertEqual(result1, input1)
        XCTAssertEqual(result2, input2)
        XCTAssertEqual(result3, input3)
    }

    func test_enqueue_1000개의_실수가_순서대로_들어가는지_테스트() throws {
        // given
        var expectation: [Double] = []
        
        for input in 0...999 {
            expectation.append(Double(input))
            sut.enqueue(element: Double(input))
        }
        
        // when
        var result: Double?
        
        // then
        for i in 0...999 {
            result = sut.dequeue()
            XCTAssertEqual(result, expectation[i])
        }
    }

    func test_isEmpty_빈_큐임을_정상적으로_인지하는지_테스트() throws {
        // given
        sut.clearQueue()
        
        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }

    func test_isEmpty_enqueue_메서드가_호출될때_비어있지_않은_배열로_인지하는지_테스트() throws {
        // given
        sut.enqueue(element: 1.0)

        // when
        let result = sut.isEmpty

        // then
        XCTAssertFalse(result)
    }
    
    func test_dequeue_실수가_순서대로_제거되는지_테스트() throws {
        // given
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        let expectation1 = 1.0
        let expectation2 = 2.0

        // when
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()

        // then
        XCTAssertEqual(result1, expectation1)
        XCTAssertEqual(result2, expectation2)
    }

    func test_peek_peek를_정상적으로_반환하는지_테스트() throws {
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        let expectaion = 1.0

        let result = sut.peek

        XCTAssertEqual(result, expectaion)
    }


    func test_peek_dequeue_메서드_호출시_peek를_정상적으로_반환하는지_테스트() throws {
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        _ = sut.dequeue()
        let expectaion = 2.0

        let result = sut.peek

        XCTAssertEqual(result, expectaion)
    }
}
