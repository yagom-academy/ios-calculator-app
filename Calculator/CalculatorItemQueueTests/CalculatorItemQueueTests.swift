//  CalculatorItemQueueTests - CalculatorItemQueueTests.swift
//  created by vetto on 2023/01/25

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // isEmpty property test
    func test_head가_nil일_때_isQueueEmpty호출하면_true이다() {
        let result = sut.isEmpty
        let expectation = true
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_CalculatorItemQueue에_enqueue를_하고_isQueueEmpty호출하면_false이다() {
        sut.head = Node(data: "head")
        
        let result = sut.isEmpty
        let expectation = false
        
        XCTAssertEqual(result, expectation)
    }
}
