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
        // when
        array.forEach { value in
            sut.enqueue(value)
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
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        // then
        let result = sut.peekFirst
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue의_첫_번째_값이_out_되서_반환된다() {
        do {
            // given
            let array = [3.2, 2.0, 3.0, 4.0]
            
            let expectation = 3.2
            // when
            try array.forEach { value in
                try sut.enqueue(value)
            }
            let result = try sut.dequeue()
            // then
            XCTAssertEqual(result, expectation)
            
        } catch {}
    }
    
    func test_queue의_마지막_값을_반환한다() throws {
        // given
        let firstValue = 3.2
        let secondValue = 2.0
        let expectation = 2.0
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        // then
        let result = sut.peekLast
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue의_모든_값을_제거할_수_있다() {
        do {
            // given
            let array = [3.2, 2.0, 3.0, 4.0]
            
            // when
            try array.forEach { value in
                try sut.enqueue(value)
            }
            try sut.removeAll()
        } catch {}
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue는_숫자값만_분리할_수_있다() {
        do {
            // given
            let array: [Any] = [3.2, Operator.add,
                         2.0, 3.0, 4.0]
            let operands = CalculatorItemQueue<Double>()
            
            let expectation = 3.2
            // when
            try array.forEach { value in
                guard let number = value as? Double else {
                    return
                }
                try sut.enqueue(number)
            }
            
            let result = sut.peekFirst
            // then
            XCTAssertEqual(result, expectation)
            
        } catch {}
    }
}
