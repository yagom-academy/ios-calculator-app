//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Derrick kim on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue에_값을_추가한다() throws {
        // given
        let array = [3.2, 2.0, 3.0, 4.0]

        let expectation = 2.0
        // when
        array.forEach { value in
            sut.enQueue(value)
        }
        // then
        let result = sut.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_queue의_첫_번째_값을_반환한다() throws {
        // given
        let firstValue = 3.2
        let secondValue = 2.0
        let expectation = 3.2
        // when
        sut.enQueue(firstValue)
        sut.enQueue(secondValue)
        // then
        let result = sut.peek
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue의_첫_번째_값이_out_되서_반환된다() {
        // given
        let array = [3.2, 2.0, 3.0, 4.0]

        let expectation = 3.2
        // when
        array.forEach { value in
            sut.enQueue(value)
        }
        
        // then
        let result = sut.deQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue의_모든_값을_제거할_수_있다() {
        // given
        let array = [3.2, 2.0, 3.0, 4.0]

        // when
        array.forEach { value in
            sut.enQueue(value)
        }
        sut.removeAll()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
