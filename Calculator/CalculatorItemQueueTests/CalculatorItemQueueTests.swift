//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by hoon, hemg on 2023/05/31.
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
    
    func test_enqueue_0을추가하고_LinkedList에서첫data를반환하면_0을반환한다() {
        // given
        let expectedData: Int = 0
        
        // when
        sut.enqueue(expectedData)
        let result: Int? = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectedData)
    }
    
    func test_dequeue_0을추가하고_dequeue를하면_0을반환한다() {
        // given
        let expectedData: Int = 0
        
        // when
        sut.enqueue(expectedData)
        let poppedData = sut.dequeue()
        
        // then
        XCTAssertEqual(poppedData, expectedData)
    }
}

//MARK: - Extension
extension Int: CalculateItem {}
