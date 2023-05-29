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
        let result = sut.count()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_isEmpty_호출하면_queue가_비었으니_true를_반환합니다() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue_값을_넣으면_isEmpty에서_false를_반환합니다() {
        let input: CalculateItem = Double(10)
        sut.enqueue(input)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_denqueue_호출하면_값이_없으니_nil을_반환합니다() {
        let result = sut.dequeue()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_denqueue_호출하면_값이_있을때_가장_앞의_값을_반환합니다() {
        var input: CalculateItem = 1.0
        sut.enqueue(input)
        input = Operator.plus
        sut.enqueue(input)
        input = 3.0
        sut.enqueue(input)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 1.0)
    }
}
