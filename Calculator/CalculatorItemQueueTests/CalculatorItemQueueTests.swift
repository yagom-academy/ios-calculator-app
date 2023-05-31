//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Daehoon Lee on 2023/05/31.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_LinkedList에새로운Node추가() {
        // given
        let expectedData: Int = 0
        
        // when
        sut.enqueue(expectedData)
        
        // then
        XCTAssertEqual(sut.linkedList.head?.data, expectedData)
    }
    
    func test_dequeue_LinkedList에서첫Node를반환한다() {
        // given
        let expectedData: Int = 0
        
        // when
        sut.enqueue(expectedData)
        let poppedData: Int = sut.dequeue()
        
        // then
        XCTAssertEqual(poppedData, expectedData)
    }
}
