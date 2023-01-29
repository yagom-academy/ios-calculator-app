//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Andrew on 2023/01/25.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈배열일경우_isEmpty에서_true값을반환하는함수() {
        // given
        sut.enqueue(element: 9)
        sut.enqueue(element: 3)
        sut.enqueue(element: 4)
        sut.enqueue(element: 11)
        
        // when
        sut.clearQueue()
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_빈배열에서_요소를삭제를시도할경우_nil값반환하는함수() {
        // given
        sut.enqueue(element: 9)
        
        // when
        sut.clearQueue()
        
        // then
        XCTAssertNil(sut.dequeue())
    }

}
