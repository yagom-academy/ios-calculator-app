//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 나이든별, 민쏜
//

import XCTest
@testable import Calculator

struct CalculateItemTester: CalculateItem {
    let value: Int
}

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<CalculateItemTester>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CalculatorItemQueue<CalculateItemTester>(array: [CalculateItemTester(value: 5)])
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_큐에_원소가있을때_isEmpty가_false를_반환() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_peek은_첫번째원소인_5를_보여줌() {
        // when
        let result = sut.peek?.value
        
        // then
        XCTAssertEqual(result, 5)
    }
    
    func test_peek은_원소가없을경우_nil을_반환() {
        // given
        sut.dequeue()
        
        // when
        let result = sut.peek?.value
        
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue로_큐의첫번째원소인_5를_제거하고_그값을반환() {
        // when
        let result = sut.dequeue()?.value
        
        // then
        XCTAssertEqual(result, 5)
    }
    
    func test_큐가비어있을때_dequeue는_nil을_반환() {
        // given
        sut.dequeue()
        
        // when
        let result = sut.dequeue()?.value
        
        // then
        XCTAssertNil(result)
    }
    
    func test_enqueue로_큐에_4를삽입하고_확인() {
        // given
        sut.enqueue(CalculateItemTester(value: 4))
        sut.dequeue()
        
        // when
        let result = sut.peek?.value
        
        // then
        XCTAssertEqual(result, 4)
    }
}
