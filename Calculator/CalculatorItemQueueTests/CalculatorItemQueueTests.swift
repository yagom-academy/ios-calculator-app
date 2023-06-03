//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by EtialMoon on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_init에1_2_3을넣으면_enqueuedCalculatorItems에1_2_3이있다() {
        for input in 1...3 {
            sut.enqueue(Double(input))
        }
        let expectation = [1.0, 2.0, 3.0]
        
        let result = sut.enqueuedCalculatorItems
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueuedCalculatorItems에1_2가있으면_dequeue를했을때_1이반환된다() {
        for input in 1...2 {
            sut.enqueue(Double(input))
        }
        let expectation = 1.0
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueuedCalculatorItems에1이있으면_dequeue를했을때_enqueuedCalculatorItems가비어있다() {
        sut.enqueue(1.0)
        
        sut.dequeue()
        let result = sut.enqueuedCalculatorItems.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_dequeueCalculatorItems가비어있으면_dequeue를했을때_nil을반환한다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
}
