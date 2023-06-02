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
        for input in 1...3 {
            sut.enqueue("\(input)")
        }
        let expectation = ["1", "2", "3"]
        
        let result = sut.enqueuedCalculatorItems
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue에1을넣으면_enqueuedCalculatorItems에1이있다() {
        let input = "1"
        
        sut.enqueue(input)
        let result = sut.enqueuedCalculatorItems.first
        
        XCTAssertEqual(input, result)
    }
    
    func test_enqueue에더하기기호를넣으면_enqueuedCalculatorItems에더하기기호가있다() {
        let input = "+"
        
        sut.enqueue(input)
        let result = sut.enqueuedCalculatorItems.first
        
        XCTAssertEqual(input, result)
    }
    
    func test_enqueuedCalculatorItems에1_2가있으면_dequeue를했을때_1이반환된다() {
        for item in 1...2 {
            sut.enqueue("\(item)")
        }
        let expectation = "1"
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueuedCalculatorItems에더하기기호가있으면_dequeue를했을때_더하기기호가반환된다() {
        sut.enqueue("+")
        let expectation = "+"
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueuedCalculatorItems에1이있으면_dequeue를했을때_enqueuedCalculatorItems가비어있다() {
        sut.enqueue("1")
        
        sut.dequeue()
        let result = sut.enqueuedCalculatorItems.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_dequeueCalculatorItems가비어있으면_dequeue를했을때_nil을반환한다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
}
