//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by smfc on 19/9/2022.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가비어있을때_enqueue메서드를통해입력되는지확인() {
        // given
        let input = "1"
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertEqual(sut.queue, ["1"])
    }
    
    func test_큐가이미들어있을때_enqueue로새로추가한엘리먼트가뒤로추가되는지확인() {
        // given
        sut.queue = ["1"]
        let input = "2"
        
        // when
        let _ = sut.enqueue(input)
        
        // then
        XCTAssertEqual(sut.queue[1], "2")
    }
    
    
}
