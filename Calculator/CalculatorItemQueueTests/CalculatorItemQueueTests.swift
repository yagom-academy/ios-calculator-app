//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Harry on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculaterItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculaterItemQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue호출시_queue가_element를포함한다() {
        // given
        let element = "+"
        let expectation = true

        // when
        sut.enqueue(element)
        let result = sut.queue.contains(element)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue호출시_queue에아무것도없다면_nil반환한다() {
        sut.queue = []
        let expectation: String? = nil
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue호출시_queue의_첫번쨰element를_제거하고_반환한다() {
        sut.queue = ["1", "+", "2"]
        let expectation = "1"
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }

}
