//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by karen, Mary.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    func test_0을enqueue의인수로넣고호출하면_큐의첫번째값은_0이다() {
        // given
        let input = 0
        sut.enqueue(input)

        // when
        let result = sut.peek
        let expectation = 0

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue를3번호출하면_큐의사이즈는_3이다() {
        // given
        let inputs = [0, 1, 2]
        for input in inputs {
            sut.enqueue(input)
        }

        // when
        let result = sut.size
        let expectation = 3

        // then
        XCTAssertEqual(result, expectation)
    }

    func test_큐가비어있을때_dequeue를호출하면_nil을반환한다() {
        // given
        // when
        let result = sut.dequeue()

        // then
        XCTAssertNil(result)
    }

    func test_큐에1개의아이템이있을때_dequeue를호출하면반환값과사이즈는_해당아이템과0이다() {
        // given
        let input = 10
        sut.enqueue(input)

        // when
        let returnValue = sut.dequeue()
        let returnValueExpectation = 10
        let afterQueue = sut.size
        let afterQueueExpectation = 0

        // then
        XCTAssertEqual(returnValue, returnValueExpectation)
        XCTAssertEqual(afterQueue, afterQueueExpectation)
    }
}
