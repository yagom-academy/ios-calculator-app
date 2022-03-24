//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 이시원 on 2022/03/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var mock: MockList<Int>!
    var sut: CalculatorItemQueue<MockList<Int>>!

    override func setUpWithError() throws {
        mock = MockList<Int>()
        sut = CalculatorItemQueue<MockList<Int>>(mock)
    }
    
    func test_enqueue() {
        // given
        let testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        
        // then
        XCTAssertEqual(testData, mock.mockData)
    }
    
    func test_dequeue() {
        // given
        var testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        sut.dequeue()
        testData.remove(at: 0)

        // then
        XCTAssertEqual(testData, mock.mockData)
    }
    
    func test_removeAll() {
        // given
        var testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        sut.removeAll()
        testData.removeAll()

        // then
        XCTAssertEqual(testData, mock.mockData)
    }
    
    func test_isEmpty_Equal() {
        // given
        let testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        
        // then
        XCTAssertEqual(testData.isEmpty, sut.isEmpty)
    }
    
    func test_count_Equal() {
        // given
        let testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        
        // then
        XCTAssertEqual(testData.count, sut.count)
    }

}
