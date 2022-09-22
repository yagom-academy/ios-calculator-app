//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Baem on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue의_enqueue실행시_queue_에_추가가되는지() {
        // given
        let number: CalculatorItem = "50"
        
        // when
        sut?.enqueue(number)
        
        // then
        XCTAssertTrue(sut?.isEmpty != nil)
    }
    
    func test_dequeue실행시_queue가_비어있을_때_nil을_리턴하는지() {
        // when
        let result = sut?.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue실행시_queue가_값을_가질때_dequeue의_값이_반환되고_삭제되는지() {
        // given
        let queue1: Int = 10
        
        // when
        sut?.enqueue(queue1)
        let result = sut?.dequeue()

        // then
        XCTAssertEqual(sut?.count, 0)
        XCTAssertEqual(result as! Int, queue1)
    }
}
