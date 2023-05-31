//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kangkyungmin on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Any>()
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue에_enqueue메서드를_실행할때_linkedList인스턴스의_enqueue메서드를_실행해주는지_확인() {
        //given, when, then
        sut?.enqueue(1)
        sut?.enqueue(2)
        sut?.enqueue(3)
        sut?.enqueue(4)
    }
    
    func test_CalculatorItemQueue에_dequeue메서드를_실행할때_linkedList인스턴스의_dequeue메서드를_실행해주는지_확인() {
        //given
        sut?.enqueue(1)
        sut?.enqueue(2)
        sut?.enqueue(3)
        //when, then
        XCTAssertNotNil(sut?.dequeue())
        XCTAssertNotNil(sut?.dequeue())
        XCTAssertNotNil(sut?.dequeue())
        XCTAssertNil(sut?.dequeue())
    }
}
