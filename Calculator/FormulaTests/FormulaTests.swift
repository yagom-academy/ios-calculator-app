//  FormulaTests.swift
//  FormulaTests
//  Created by LJ on 2022/09/23.

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testExample() throws {}
    func testPerformanceExample() throws { measure {} }

    var formulaObject: Formula = Formula()
    func test_숫자3개_혼합연산하는_경우() {
        //given
        formulaObject.operands.enqueue(element: 5.0)
        formulaObject.operands.enqueue(element: -10.0)
        formulaObject.operands.enqueue(element: 3.0)
        formulaObject.operators.enqueue(element: .add)
        formulaObject.operators.enqueue(element: .multiply)
        
        //when
        let result = formulaObject.result()
        
        //then
        print(result)
        XCTAssertEqual(result, -15)
    }
    
    func test_숫자4개_혼합연산하는_경우() {
        //given
        formulaObject.operands.enqueue(element: 5.0)
        formulaObject.operands.enqueue(element: -10.0)
        formulaObject.operands.enqueue(element: 3.0)
        formulaObject.operands.enqueue(element: -7.0)
        formulaObject.operators.enqueue(element: .add)
        formulaObject.operators.enqueue(element: .add)
        formulaObject.operators.enqueue(element: .multiply)
        
        //when
        let result = formulaObject.result()
        
        //then
        print(result)
        XCTAssertEqual(result, 14)
    }
    
    func test_연산자가_하나남는경우() {
        //given
        formulaObject.operands.enqueue(element: 5.0)
        formulaObject.operands.enqueue(element: -10.0)
        formulaObject.operands.enqueue(element: 3.0)
        formulaObject.operators.enqueue(element: .add)
        formulaObject.operators.enqueue(element: .add)
        formulaObject.operators.enqueue(element: .multiply)

        //when
        let result = formulaObject.result()
        
        //then
        print(result)
        XCTAssertEqual(result, -2)
    }
    
    func test_0으로나누는연산_성공하는지() {
        //given
        formulaObject.operands.enqueue(element: 5.0)
        formulaObject.operands.enqueue(element: 0)
        formulaObject.operators.enqueue(element: .divide)
        
        //when
        let result = formulaObject.result()

        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_빼기연산_성공하는지() {
        //given
        formulaObject.operands.enqueue(element: 5.0)
        formulaObject.operands.enqueue(element: -10.0)
        formulaObject.operators.enqueue(element: .subtract)
        
        //when
        let result = formulaObject.result()

        //then
        XCTAssertEqual(result, 15.0)
    }
    
    func test_곱하기연산_성공하는지() {
        //given
        formulaObject.operands.enqueue(element: 5.0)
        formulaObject.operands.enqueue(element: -10.0)
        formulaObject.operators.enqueue(element: .multiply)
        
        //when
        let result = formulaObject.result()

        //then
        XCTAssertEqual(result, -50)
    }
    
    func test_나누기연산_성공하는지() {
        //given
        formulaObject.operands.enqueue(element: 50.0)
        formulaObject.operands.enqueue(element: -10.0)
        formulaObject.operators.enqueue(element: .divide)
        
        //when
        let result = formulaObject.result()
        
        //then
        XCTAssertEqual(result, -5)
    }

}
