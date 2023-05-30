//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Erick on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_count_호출하면_queue의_개수_0을_반환합니다() {
        let result = sut.count
        let expectation = 0
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty_호출하면_queue가_비었으니_true를_반환합니다() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue_값을_넣으면_isEmpty에서_false를_반환합니다() {
        let input: CalculateItem = Operator.plus
        sut.enqueue(input)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_denqueue_호출하면_값이_없으니_nil을_반환합니다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_denqueue_호출하면_값이_있을때_가장_앞의_값을_반환합니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        
        let expectation = 1.0
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result as? Double, expectation)
    }
    
    func test_denqueue_호출하면_큐의_맨앞의_데이터가_없어지니_길이가_줄어듭니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        sut.dequeue()
        
        let expectation = 9
        
        let result = sut.count
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_claer_호출하면_큐의_모든_데이터가_지워져_isEmpty가_true를_반환합니다() {
        for input in 1...10 {
            sut.enqueue(Double(input))
        }
        sut.clear()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
}
