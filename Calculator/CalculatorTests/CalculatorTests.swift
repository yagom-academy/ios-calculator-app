//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by redmango1446 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueueStack에_값이_추가된다() {
        // given
        sut.enqueue("1")
        // when
        let expectedValue = "1"
        // then
        XCTAssertEqual(sut.enqueueStack.first, expectedValue)
    }
    
    func test_stack에_값이_없으면_true를_반환한다() {
        // given
        
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_stack에_값이_있으면_false를_반환한다() {
        // given
        sut.enqueue("1")
        // when
        let result = sut.isEmpty
        // then
        XCTAssertFalse(result)
    }
    
    func test_enqueueStack의_첫번째로_들어간_값을_반환한다() {
        // given
        let input = ["1", "2", "3"]
        for item in input {
            sut.enqueue(item)
        }
        //when
        let expectedValue = "1"
        // then
        XCTAssertEqual(sut.dequeue(), expectedValue)
    }
    
    func test_stack의_값이_없을때_dequeue를_하면_nil이_반환된다() {
        //when
        let expectedValue: String? = nil
        // then
        XCTAssertEqual(sut.dequeue(), expectedValue)
    }
}
