//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 이시원 on 2022/03/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var mook: MookList<Int>!
    var sut: CalculatorItemQueue<MookList<Int>>!

    override func setUpWithError() throws {
        mook = MookList<Int>()
        sut = CalculatorItemQueue<MookList<Int>>(mook)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_enqueue() {
        // given
        let testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )

        // when

        // then
        XCTAssertEqual(testData, mook.dataA)
    }
    
    func test_dequeue() {
        // given
        var testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        sut.dequeue()
        testData.remove(at: 0)

        // when

        // then
        XCTAssertEqual(testData, mook.dataA)
    }
    
    func test_removeAll() {
        // given
        var testData = [1, 2, 3]
        testData.forEach( sut.enqueue(_:) )
        sut.removeAll()
        testData.removeAll()

        // when

        // then
        XCTAssertEqual(testData, mook.dataA)
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

class MookList<T>: List {
    
    var dataA: [T] = []
    
    var isEmpty: Bool { dataA.isEmpty }
    
    var count: Int { dataA.count }
    
    func append(_ data: T) {
        dataA.append(data)
    }
    
    func removeFirst() -> T? {
        return dataA.remove(at: 0)
    }
    
    func removeAll() {
        dataA.removeAll()
    }
    

    
    
    
}
