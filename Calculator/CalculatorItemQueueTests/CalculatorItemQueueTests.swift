//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//  Created by LJ on 2022/09/19.

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testExample() throws {}
    func testPerformanceExample() throws { measure {} }
    
    func test_enqueueStack에_값이_정상적으로_추가되는지() {
        //given
        sut.enqueue(element: 10.0)
        sut.enqueue(element: 100.0)
        sut.enqueue(element: 200.0)
        
        //when
        let result: [Double] = sut.enqueueStack

        //then
        XCTAssertEqual(result, [10, 100, 200])
    }
    
    func test_dequeueStack이_비어있지않은경우_값을_넣지않는지() {
        //given
        sut.enqueueStack = [100.0, 200.0]
        var result = sut.dequeue()
        sut.enqueue(element: 300.0)
        sut.enqueue(element: 400.0)
        
        //when
        result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 200.0)
    }
}
