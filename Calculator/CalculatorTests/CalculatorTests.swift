//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by mint on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count가_작동하는지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_firstStack에_순서대로요소가추가되는지() {
        //given
        let input = 10
        let nextInput = 20
        
        //when
        sut.enqueue(input)
        sut.enqueue(nextInput)
        
        //then
        XCTAssertEqual(sut.firstStack, [10, 20])
    }
    
    func test_firstStack에서_pop한요소가_backwardStack에_push되는지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let result = sut.reversedStack(sut.firstStack)
        
        //then
        XCTAssertEqual(result, [3, 2, 1])
    }
    
    func test_deQueue_하면선입선출결과나오는지() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
        XCTAssertEqual(sut.firstStack, [2])
    }
    
    func test_deQueue_에서할게없을때_nil반환하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
}
