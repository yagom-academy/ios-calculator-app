//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 표현수 on 2023/05/29.
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
        let input = Double(10)
        sut.enqueue(input)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_enqueue_값을_넣으면_넣은_값을_반환합니다() {
        let input = Double(10)
        
        let result = sut.enqueue(input)
        
        XCTAssertEqual(result as? Double, input)
    }
    
    func test_denqueue_호출하면_값이_없으니_nil을_반환합니다() {
        let result = sut.dequeue()
        
        XCTAssertEqual(result, nil)
    }
}
