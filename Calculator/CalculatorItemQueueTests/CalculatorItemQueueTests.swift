//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 전민수 on 2022/05/16.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        sut = nil
    }

    func test_enqueue_enqueueStack에_자연수가_순서대로_들어가는지_테스트() throws {
        let input1: Double = 1
        let input2: Double = 9999
        let expectation: [Double] = [1, 9999]
        
        var result = sut.enqueue(element: input1)
        result = sut.enqueue(element: input2)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueueStack에_0과_음의정수가_순서대로_들어가는지_테스트() throws {
        let input1: Double = 0
        let input2: Double = -9999
        let expectation: [Double] = [0, -9999]

        var result = sut.enqueue(element: input1)
        result = sut.enqueue(element: input2)

        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueueStack에_실수가_순서대로_들어가는지_테스트() throws {
        let input1 = 1.0
        let input2 = 2.0
        let expectation = [1.0, 2.0]
        
        var result = sut.enqueue(element: input1)
        result = sut.enqueue(element: input2)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueueStack에_중복된_실수가_제대로_들어가는지_테스트() throws {
        let input1 = 1.0
        let input2 = 1.0
        let expectation = [1.0, 1.0]
        
        var result = sut.enqueue(element: input1)
        result = sut.enqueue(element: input2)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueueStack에_100개의_실수가_순서대로_들어가는지_테스트() throws {
        var expectation: [Double] = []
        
        for input in 0...99 {
            expectation.append(Double(input))
            _ = sut.enqueue(element: Double(input))
        }

        let result = sut.enqueueStack
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty_enqueueStack에_값이_없을때_빈_배열로_인지하는지_테스트() throws {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_enqueueStack에_값이_있을때_비어있지_않은_배열로_인지하는지_테스트() throws {
        let enqueStack = sut.enqueue(element: 1.0)
        
        let result = enqueStack.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_dequeue_dequeueStack에_실수가_순서대로_제거되는지_테스트() throws {
        _ = sut.enqueue(element: 1.0)
        _ = sut.enqueue(element: 2.0)
        _ = sut.enqueue(element: 3.0)
        let expectation = 1.0
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_dequeueStack이_빈_배열일_때_dequeue가_되는_값이_없는지_테스트() throws {
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_clearQueue_enqueueStack이_빈_배열이_아닐때_clearQueue를_통해_빈_배열이_되는지_테스트() throws {
        _ = sut.enqueue(element: 1.0)
        _ = sut.enqueue(element: 2.0)
        sut.clearQueue()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_clearQueue_dequeueStack이_빈_배열이_아닐때_clearQueue를_통해_빈_배열이_되는지_테스트() throws {
        _ = sut.enqueue(element: 1.0)
        _ = sut.enqueue(element: 2.0)
        _ = sut.dequeue()
        sut.clearQueue()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_peek_enqueueStack이_빈_배열일때_peek를_정상적으로_반환하는지_테스트() throws {
        _ = sut.enqueue(element: 1.0)
        _ = sut.enqueue(element: 2.0)
        let expectaion = 1.0
        
        let result = sut.peek
        
        XCTAssertEqual(result, expectaion)
    }
    
    func test_peek_enqueueStack이_빈_배열이_아닐때_peek를_정상적으로_반환하는지_테스트() throws {
        _ = sut.enqueue(element: 1.0)
        _ = sut.enqueue(element: 2.0)
        let expectaion = 1.0
        
        let result = sut.peek
        
        XCTAssertEqual(result, expectaion)
    }
}
