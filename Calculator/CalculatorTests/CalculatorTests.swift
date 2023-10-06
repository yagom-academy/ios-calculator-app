//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Charles on 2023/10/05.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_왼쪽컨테이너에_요소가있을때_마지막요소를_빼내는지() {
        // given
        sut = CalculatorItemQueue(dequeueContainer: [1, 2, 3], enqueueContainer: [])
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result!, sut.dequeueContainer.last)
    }
    
    func test_왼쪽컨테이너에_요소가없을때_오른쪽컨테이너에서요소를_빼내는지() {
        // given
        sut = CalculatorItemQueue(dequeueContainer: [], enqueueContainer: [3, 1, 17])
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result!, sut.enqueueContainer.first)
    }

    func test_뒤집힌요소들이들어간_왼쪽컨테이너에서_마지막요소가_제대로빠져나오는지() {
        // given
        sut = CalculatorItemQueue(dequeueContainer: [], enqueueContainer: [4, 2, 7])
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, 4)
    }
    
    func test_두개의컨테이너가_모두비었을때_true() {
        // given
        sut = CalculatorItemQueue(dequeueContainer: [], enqueueContainer: [])
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_추가한요소가_제대로들어갔는지() {
        // given
        sut = CalculatorItemQueue(dequeueContainer: [], enqueueContainer: [])
        
        // when
        sut.enqueue(3)
        
        // then
        XCTAssertTrue(sut.enqueueContainer.contains(3))
    }
}
