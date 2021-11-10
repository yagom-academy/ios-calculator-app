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
        let isEmpty = sut.items.isEmpty
        
        XCTAssertTrue(isEmpty)
    }
    
    func test_CalculatorItemQueue에enqueue했을때_Items이_비어있지않는지() {
        let item = 1
        
        sut.enqueue(value: item)
        
        let result = sut.items.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_CalculatorItemQueue에_enqueue한_값이_입력한_값과_같은지() {
        let item = 1
        
        sut.enqueue(value: item)
        
        let result = sut.items.front?.value
        
        XCTAssertEqual(result, item)
    }
    
    func test_CalculatorItemQueue에서_dequeue했을때_enqueue한_값과_같은지() {
        let item = 1
        
        sut.enqueue(value: item)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, item)
    }
}
