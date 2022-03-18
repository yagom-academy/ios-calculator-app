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

        // when

        // then
        XCTAssertEqual(testData, mock.mockData)
    }
    
    func test_dequeue() {
        // given
        var testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        sut.dequeue()
        testData.remove(at: 0)

        // when

        // then
        XCTAssertEqual(testData, mock.mockData)
    }
    
    func test_removeAll() {
        // given
        var testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        sut.removeAll()
        testData.removeAll()

        // when

        // then
        XCTAssertEqual(testData, mock.mockData)
    }
    
    func test_isEmpty_Equal() {
        // given
        let testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )

        // when

        // then
        XCTAssertEqual(testData.isEmpty, sut.isEmpty)
    }
    
    func test_count_Equal() {
        // given
        let testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )

        // when

        // then
        XCTAssertEqual(testData.count, sut.count)
    }


}

class MockList<T>: List {
    
    var mockData: [T] = []
    
    var isEmpty: Bool { mockData.isEmpty }
    
    var count: Int { mockData.count }
    
    func append(_ data: T) {
        mockData.append(data)
    }
    
    func removeFirst() -> T? {
        return mockData.remove(at: 0)
    }
    
    func removeAll() {
        mockData.removeAll()
    }

}
