//
//  CalculatorTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue에서_count값이올바르게반환되는지() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 1)
    }

    func test_CalculatorItemQueue에서_list에값이있을때_isEmpty값이올바르게반환되는지() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_CalculatorItemQueue에서_list에값이없을때_isEmpty값이올바르게반환되는지() {
        // given
        sut.removeAll()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_CalculatorItemQueue의_list에값이없을때_enqueue메서드가정상작동하는지() {
        // given
        sut.removeAll()
        
        // when
        let result = sut.list.nodeCount
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_CalculatorItemQueue의_list에값이1개일때_enqueue메서드가정상작동하는지() {
        // given
        sut.list.append(1)
        
        // when
        let result = sut.list.nodeCount
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_CalculatorItemQueue의_list에값2개이상일때_enqueue메서드가정상작동하는지() {
        // given
        sut.list.append(1)
        sut.list.append(2)
        
        // when
        let result = sut.list.nodeCount
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_CalculatorItemQueue에서_dequeue메서드가정상작동하는지() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.dequeue()
        
        // when
        let result = sut.list.nodeCount
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_CalculatorItemQueue에서_removeAll메서드가정상작동하는지() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.removeAll()
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
}
