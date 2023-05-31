//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Yena on 2023/05/30.
//

import XCTest
@testable import Calculator


final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    //var sut: CalculatorItemQueue<Any>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
        //stringSut = nil
    }
    
    func test_큐의크기를_올바르게반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        //sut.enqueue("+")
        
        // when
        let intResult = sut.count
        
        // then
        XCTAssertEqual(intResult, 4)
    }
    
    func test_큐가비어있지않을때_false를반환한다() {
        // given
        sut.enqueue(1)
        
        // when
        let intResult = sut.isEmpty
        
        // then
        XCTAssertFalse(intResult)
    }
    
    func test_큐에_요소가_올바르게들어갔다() {
        // given
        let intInput = [1, 3, 5]

        // when
        sut.enqueue(1)
        sut.enqueue(3)
        sut.enqueue(5)
        let result = sut.queue as? [Int]
                
        // then
        XCTAssertEqual(result, intInput)
    }
    
    func test_큐에서_요소가_올바르게삭제되었다() {
        // given
        let intInput = [2, 3, 5, 7]
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(5)
        sut.enqueue(7)
        
        // when
        sut.dequeue()
        let result = sut.queue as? [Int]
        
        // then
        XCTAssertEqual(result, intInput)
    }
    
    func test_큐에서_가장먼저들어온요소가_삭제되었다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(5)
        sut.enqueue(7)
        
        // when
        let result = sut.dequeue() as? Int
        
        // then
        XCTAssertEqual(result, 1)
    }
}
