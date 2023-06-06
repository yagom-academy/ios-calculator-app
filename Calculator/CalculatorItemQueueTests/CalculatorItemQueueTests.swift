//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Erick on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_queue가_비었을때_count를_호출하면_0을_반환합니다() {
        let expectation = 0
        
        let result = sut.count
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue가_비었을때_isEmpty를_호출하면_true를_반환합니다() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue를_사용하여_값을_넣으면_isEmpty에서_false를_반환합니다() {
        let input: Double = 1
        sut.enqueue(input)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue가_비었을때_dequeue를_호출하면_nil을_반환합니다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_값이_있을때_dequeue_호출하면_가장_앞의_값을_반환합니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        let expectation = 1.0
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_호출하면_큐의_맨앞의_데이터가_없어지니_count가_감소합니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        sut.dequeue()
        let expectation = 9
        
        let result = sut.count
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_clear를_호출하면_큐의_모든_데이터가_지워져_isEmpty가_true를_반환합니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        sut.clear()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_clear를_호출하면_큐의_모든_데이터가_지워져_count가_0을_반환합니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        sut.clear()
        let expectation = 0
        
        let result = sut.count
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue를_호출하여_마지막_남은_데이터를_삭제하면_clear도_작동합니다() {
        let input: Double = 1
        sut.enqueue(input)
        sut.dequeue()
        let expectation = 0
        
        let isEmptyResult = sut.isEmpty
        let countResult = sut.count
        
        XCTAssertTrue(isEmptyResult)
        XCTAssertEqual(countResult, expectation)
    }
}
