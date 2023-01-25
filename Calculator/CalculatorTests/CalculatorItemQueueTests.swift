//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Rowan on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue호출시_파라미터로전달된값이_queue에포함된다() {
        let input = 1
        let expectation = true
        
        sut.enqueue(input.description)
        let result = sut.queue.contains("1")
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue호출시_queue의count가1줄어든다() {
        sut.queue = ["1", "2", "3"]
        let expectation = 2
        
        sut.dequeue()
        let result = sut.queue.count
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue호출시_제거된element를return한다() {
        sut.queue = ["1", "2", "3"]
        let expectation = "1"
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue호출시_queue가비어있는경우nil을반환한다() {
        let expectation: String? = nil
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue호출시_head에1이더해진다() {
        sut.queue = ["1", "2", "3"]
        let expectation = 1
        
        sut.dequeue()
        let result = sut.head
        
        XCTAssertEqual(result, expectation)
    }
    
}
