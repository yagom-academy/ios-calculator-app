//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by LIMGAUI on 2021/11/09.

import XCTest

class CalculatorTests: XCTestCase {
    var calculatorItemQueue = CalculatorItemQueue<Double>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorItemQueue = CalculatorItemQueue<Double>()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        calculatorItemQueue.deleteAll()
    }
    
    func test_nodes프로퍼티의값이_순서대로정렬_되는지_여부() {
        //given
        let array: [Double] = [1,2,3,4,5]
        var result = calculatorItemQueue.bringArray
        //when
        result.append(1)
        result.append(2)
        result.append(3)
        result.append(4)
        result.append(5)
        //then
        XCTAssertEqual(result, array)
    }
    
    func test_nodes프로퍼티에_push메서드로값을넣어_값이_확인되는지_여부() {
        //given
        let result: [Double] = [2]
        //when
        calculatorItemQueue.push(1)
        calculatorItemQueue.push(2)
        calculatorItemQueue.deleteFront()
        
        let array = calculatorItemQueue.bringArray
        //then
        XCTAssertEqual(array, result)
    }
    
    func test_nodes프로퍼티의값이_push메서드와_deleteFront메서드기능이_적용되는지_여부() {
        // given
        let result: [Double] = [3,4,5]
        // when
        calculatorItemQueue.push(1)
        calculatorItemQueue.push(2)
        calculatorItemQueue.push(3)
        calculatorItemQueue.push(4)
        calculatorItemQueue.push(5)
        calculatorItemQueue.deleteFront()
        calculatorItemQueue.deleteFront()
        let array = calculatorItemQueue.bringArray
        // then
        XCTAssertEqual(array, result)
    }
    
    func test_nodes에_값을push한후_deleteFront했을때_값이있는지_여부() {
        //given
        for _ in 1...5 {
            var counterNumber: Double = 1
            calculatorItemQueue.push(counterNumber)
            counterNumber += 1
        }
        for _ in 1...5 {
            calculatorItemQueue.deleteFront()
        }
        //when
        let result = calculatorItemQueue.isEmpty
        //then
        XCTAssertTrue(result)
    }
    
    func test_nodes프로퍼티의_값이비어있는지_여부() {
        //given
        for _ in 1...5 {
            var counterNumber: Double = 1
            calculatorItemQueue.push(counterNumber)
            counterNumber += 1
        }
        for _ in 1...4 {
            calculatorItemQueue.deleteFront()
        }
        //when
        let result = calculatorItemQueue.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    func test_nodes의_값이_비어있을경우() {
        //given
        let result: Double? = nil
        //when
        calculatorItemQueue.push(1)
        calculatorItemQueue.push(2)
        calculatorItemQueue.push(3)
        calculatorItemQueue.deleteRear()
        calculatorItemQueue.deleteRear()
        calculatorItemQueue.deleteRear()
        let array = calculatorItemQueue.deleteRear()
        //then
        XCTAssertEqual(result, array)
    }
    
    func test_nodes의_프로퍼티의_값이_deleteRear통해_삭제되는지여부() {
        //given
        let result: [Double] = [1,2,3]
        //when
        calculatorItemQueue.push(1)
        calculatorItemQueue.push(2)
        calculatorItemQueue.push(3)
        calculatorItemQueue.push(4)
        calculatorItemQueue.push(5)
        calculatorItemQueue.deleteRear()
        calculatorItemQueue.deleteRear()
        
        let array = calculatorItemQueue.bringArray
        //then
        XCTAssertEqual(result, array)
    }
    
    func test_nodes프로퍼티의_크기가얼마나되는지_여부() {
        //given
        var counterNumber: Double = 0
        for _ in 1...5 {
            calculatorItemQueue.push(counterNumber)
            counterNumber += 1
        }
        //when
        let result = Double(calculatorItemQueue.arraySize)
        //then
        XCTAssertEqual(result, counterNumber)
    }
    
    func test_첫번째칸삭제메서드_nil일경우_확인() {
        calculatorItemQueue.deleteFront()
    }
}
