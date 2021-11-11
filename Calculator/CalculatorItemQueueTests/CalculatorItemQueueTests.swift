//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 황제하 on 2021/11/08.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_CalculatorItemQueue의_Items이_비어있는지() {
        // given, when
        let isEmpty = sut.items.isEmpty
        
        // then
        XCTAssertTrue(isEmpty)
    }
    
    func test_CalculatorItemQueue에enqueue했을때_Items이_비어있지않는지() {
        // given
        let item = 1
        
        // when
        sut.enqueue(value: item)
        
        let result = sut.items.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_CalculatorItemQueue에_enqueue한_값이_입력한_값과_같은지() {
        // given
        let item = 1
        
        // when
        sut.enqueue(value: item)
        
        let result = sut.items.front?.value
        
        // then
        XCTAssertEqual(result, item)
    }
    
    func test_CalculatorItemQueue에서_dequeue했을때_enqueue한_값과_같은지() {
        // given
        let item = 1
        
        // when
        sut.enqueue(value: item)
        
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, item)
    }
    
    func test_CalculatorItemQueue가_비어있는경우_dequeue했을때_nil을반환하는지() {
        // given, when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_CalculatorItemQueue에_값을2번_enqueue하고_dequeue했을때_순서대로나오는지() {
        // given
        let item1 = 1
        let item2 = 2
        
        // when
        sut.enqueue(value: item1)
        sut.enqueue(value: item2)
        
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        // then
        XCTAssertEqual(result1, item1)
        XCTAssertEqual(result2, item2)
    }
    
    func test_CalculatorItemQueue에_값을넣고_모두빼내면_빈Queue를_반환하는지() {
        // given
        let item1 = 1
        let item2 = 2
        
        // when
        sut.enqueue(value: item1)
        sut.enqueue(value: item2)
        
        sut.dequeue()
        sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_CalculatorItemQueue에_값을넣고_일부만빼내면_빈Queue를_반환하지않는지() {
        // given
        let item1 = 1
        let item2 = 2
        
        // when
        sut.enqueue(value: item1)
        sut.enqueue(value: item2)
        
        sut.dequeue()
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_CalculatorItemQueue에서_clear함수를_실행하면_빈Queue를_반환하는지() {
        // given
        let item1 = 1
        let item2 = 2
        
        // when
        sut.enqueue(value: item1)
        sut.enqueue(value: item2)
        
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
