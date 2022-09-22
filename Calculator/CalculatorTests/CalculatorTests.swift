//  CalculatorTests.swift
//  CalculatorTests
//  Created by LJ on 2022/09/19.

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testExample() throws {
    }
    
    func testPerformanceExample() throws {
        measure {
        }
    }
    
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
    
    func test_더하기연산_성공하는지() {
        //given
        let enqueueStack: [Double] = [1,2]
        let compute: Operator = .add
        
        //when
        let result: Double = compute.calculate(lhs: enqueueStack[0], rhs: enqueueStack[1])
        
        //then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_빼기연산_성공하는지() {
        //given
        let enqueueStack: [Double] = [1,-1]
        let compute: Operator = .subtract
        
        //when
        let result: Double = compute.calculate(lhs: enqueueStack[0], rhs: enqueueStack[1])

        //then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_곱하기연산_성공하는지() {
        //given
        let enqueueStack: [Double] = [1500, 3000]
        let compute: Operator = .multiply
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        
        //when
        let value: Double = compute.calculate(lhs: enqueueStack[0], rhs: enqueueStack[1])
        guard let result = numberFormatter.string(for: value) else {
            return
        }

        //then
        XCTAssertEqual(result, "4,500,000")
    }
    
    func test_나누기연산_성공하는지() {
        //given
        let enqueueStack: [Double] = [10000, 3]
        let compute: Operator = .divide
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.numberStyle = .decimal
        
        //when
        let value: Double = compute.calculate(lhs: enqueueStack[0], rhs: enqueueStack[1])
        guard let result = numberFormatter.string(for: value) else {
            return
        }

        //then
        XCTAssertEqual(result, "3,333.33333")
    }
}
