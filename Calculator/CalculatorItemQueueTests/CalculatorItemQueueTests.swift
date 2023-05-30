//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by EtialMoon on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_init에1_2_3을넣으면_enqueuedCalculatorItems에1_2_3이있다() {
        let input = ["1", "2", "3"]
        
        sut = CalculatorItemQueue(input)
        let result = sut.enqueuedCalculatorItems
        
        XCTAssertEqual(input, result)
    }
    
    func test_enqueue에1을넣으면_enqueuedCalculatorItems에1이있다() {
        let input = "1"
        
        sut.enqueue(input)
        let result = sut.enqueuedCalculatorItems.first
        
        XCTAssertEqual(input, result)
    }
    
    func test_enqueuedCalculatorItems에1이있으면_dequeue를했을때_1이반환된다() {
        sut = CalculatorItemQueue(["1"])
        let expectation = "1"
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueuedCalculatorItems에1이있으면_dequeue를했을때_enqueuedCalculatorItems가비어있다() {
        sut = CalculatorItemQueue(["1"])
        
        sut.dequeue()
        let result = sut.enqueuedCalculatorItems.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_dequeueCalculatorItems가비어있으면_dequeue를했을때_nil을반환한다() {
        let expectation: String? = nil
        
        sut.dequeue()
        let result = sut.dequeueCalculatorItems.first
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCalculatorItems가비어있으면_dequeue했을때_enqueuedCalculatorItems가비어있다() {
        let expectation: String? = nil
        
        sut.dequeue()
        let result = sut.enqueuedCalculatorItems.first
        
        XCTAssertEqual(result, expectation)
    }
}
