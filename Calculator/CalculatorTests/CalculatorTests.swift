//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Andrew on 2023/01/25.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
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
    
    func test_요소를삭제할때_첫번째요소가삭제되는지_확인하는함수() {
        sut.enqueue(element: 9)
        sut.enqueue(element: 3)
        sut.enqueue(element: 4)
        sut.enqueue(element: 11)
        sut.dequeue()
        let result = [3,4,11]
        
    }

}
