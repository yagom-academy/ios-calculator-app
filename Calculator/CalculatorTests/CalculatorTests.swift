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
    
    func test_rightStack에_값이_정상적으로_추가되는지() {
        //given
        sut.enqueue(element: 10.0)
        sut.enqueue(element: 100.0)
        sut.enqueue(element: 200.0)
        
        //when
        let result: [Double] = sut.rightStack

        //then
        XCTAssertEqual(result, [10, 100, 200])
    }
    
    func test_leftStack이_비어있지않은경우_값을_넣지않는지() {
        //given
        sut.rightStack = [100.0, 200.0]
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
        let rightStack: [Double] = [1,2]
        let compute: Operator = .plus
        
        //when
        let result: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        
        //then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_빼기연산_성공하는지() {
        //given
        let rightStack: [Double] = [1,-1]
        let compute: Operator = .minus
        
        //when
        let result: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])

        //then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_곱하기연산_성공하는지() {
        //given
        let rightStack: [Double] = [1500, 3000]
        let compute: Operator = .multiplication
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        
        //when
        let value: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        guard let result = numberFormatter.string(for: value) else {
            return
        }

        //then
        XCTAssertEqual(result, "4,500,000")
    }
    
    func test_나누기연산_성공하는지() {
        //given
        let rightStack: [Double] = [10000, 3]
        let compute: Operator = .division
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.numberStyle = .decimal
        
        //when
        let value: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        guard let result = numberFormatter.string(for: value) else {
            return
        }

        //then
        XCTAssertEqual(result, "3,333.33333")
    }
}
