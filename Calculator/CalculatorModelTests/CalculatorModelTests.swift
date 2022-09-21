//
//  CalculatorModelTests.swift
//  CalculatorModelTests
//
//  Created by Victor on 2022/09/21.
//

import XCTest
@testable import Calculator

class CalculatorModelTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_printQueueCount() {
        // given
        
        
        // when
        let result: Int = sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_returnIsQueueEmpty() {
        // given
        
        
        // when
        let result: Bool = sut.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_enqueue() {
        // given
        let input = ["1", "+", "3"]
        
        // when
        for element in input {
            sut.enqueue(element)
        }
        
        // then
        XCTAssertEqual(sut.queue, ["1", "+", "3"])
    }
    
    func test_dequeue() {
        // given
        sut.queue = ["1", "+", "3"]
        
        // when
        let result: String? = sut.dequeue()
        
        // then
        XCTAssertEqual(result, "1")
        XCTAssertEqual(sut.queue, ["+", "3"])
    }
}
