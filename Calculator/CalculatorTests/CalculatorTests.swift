//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by LIMGAUI on 2021/11/09.

import XCTest

class CalculatorTests: XCTestCase {
    var calculatorItemQueue: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorItemQueue = CalculatorItemQueue()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        calculatorItemQueue = nil
    }
    
    func test_nodes프로퍼티의값이_순서대로정렬_되는지_여부() {
        //given
        let nodes = [1,2,3,4,5]
        var result = calculatorItemQueue.bringNodes()
        //when
        result.append(1)
        result.append(2)
        result.append(3)
        result.append(4)
        result.append(5)
        //then
        XCTAssertEqual(result, nodes)
    }
    
    func test_nodes프로퍼티에_push메서드로값을넣어_값이_확인되는지_여부() {
        //given
        let result = [2]
        //when
        calculatorItemQueue.push(1)
        calculatorItemQueue.push(2)
        calculatorItemQueue.deleteFront()
        
        let nodes = calculatorItemQueue.bringNodes()
        //then
        XCTAssertEqual(nodes, result)
    }
    
    func test_nodes프로퍼티의값이_push메서드와_deleteFront메서드기능이_적용되는지_여부() {
        // given
        let result = [3,4,5]
        // when
        calculatorItemQueue.push(1)
        calculatorItemQueue.push(2)
        calculatorItemQueue.push(3)
        calculatorItemQueue.push(4)
        calculatorItemQueue.push(5)
        calculatorItemQueue.deleteFront()
        calculatorItemQueue.deleteFront()
        let nodes = calculatorItemQueue.bringNodes()
        // then
        XCTAssertEqual(nodes, result)
    }
    
    func test_nodes에_값을push한후_deleteFront했을때_값이있는지_여부() {
        //given
        for _ in 1...5 {
            var counterNumber = 1
            calculatorItemQueue.push(counterNumber)
            counterNumber += 1
        }
        for _ in 1...5 {
            calculatorItemQueue.deleteFront()
        }
        //when
        let result = calculatorItemQueue.isEmpty()
        //then
        XCTAssertTrue(result)
    }
}
