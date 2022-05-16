//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김동용 on 2022/05/16.
//

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
    
    func test_isEmpty_프로퍼티로_왼쪽과_오른쪽스택과배열이_모두비어있으면_true를_반환하는가() {
        //given
        let leftStack: Array<Double> = []
        let rightStack: Array<Double> = []
        var isEmpty: Bool { return (leftStack.isEmpty && rightStack.isEmpty) }
        
        //when
        let result = true
        
        //then
        XCTAssertTrue(isEmpty)
    }
    
    func test_peek_프로퍼티가_왼쪽스택이_비어있지않으면_왼쪽스택의마지막배열을_오른쪽스택의첫번째배열로_반환하는가() {
        //given
        sut.leftStack = [1.0, 2.0, 3.0]
        sut.rightStack = [3.0, 2.0]
        //when
        func isReturnWhichStack() -> Double {
            if !sut.leftStack.isEmpty {
                return sut.leftStack.first ?? -10000.0
            } else {
                return sut.rightStack.last ?? -10000.0
            }
        }
        let result = isReturnWhichStack()
        
        //then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_enQueue함수를_호출했을때_왼쪽스택에_값을더하는가() {
        //given
        sut.leftStack = [1.0, 2.0, 3.0]
        sut.rightStack = [3.0, 2.0]
        let input = 4.0
        //when
        func test_enQueue() {
            sut.leftStack.append(input)
        }
        test_enQueue()
        let result = sut.leftStack.last
        //then
        XCTAssertEqual(result, 4.0)
    }
    
    func test_deQueue함수를_호출했을때_오른쪽스택이_비어있으면_왼쪽스택의순서를뒤집어_오른쪽스택에집어넣는가() {
        //given
        sut.leftStack = [1.0, 2.0, 3.0]
        sut.rightStack = []
        //when
        func test_deQueue() {
            if sut.rightStack.isEmpty {
                sut.rightStack = sut.leftStack.reversed()
            }
        }
        
        test_deQueue()
        if sut.rightStack.isEmpty {
            sut.rightStack = sut.leftStack.reversed()
        }
        
        let result = sut.rightStack
        //then
        XCTAssertEqual(result, [3.0, 2.0, 1.0])
    }
    
    func test_deQueue함수를_호출했을때_왼쪽스택의순서를뒤집어_오른쪽스택에집어넣었으면_왼쪽스택의요소를_모두없애는가() {
        //given
        sut.leftStack = [1.0, 2.0, 3.0]
        sut.rightStack = [3.0, 2.0, 1.0]
        //when
        func test_deQueue() {
            if sut.leftStack.reversed() == sut.rightStack {
                sut.leftStack.removeAll()
            }
        }
       
        test_deQueue()
        
        let result = sut.leftStack
        //then
        XCTAssertEqual(result, [])
    }
    
    func test_deQueue함수를_호출했을때_오른쪽스택의배열에서_마지막값을반환하는가() {
        //given
        sut.rightStack = [3.0, 2.0, 1.0]
        //when
        func test_deQueue() -> Double {
            return sut.rightStack.last ?? -10000.0
        }
        
        let result = test_deQueue()
        //then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_오른쪽스택이_비어있을때_enQueue함수를_호출하고_deQueue를호출하면_값이제대로_넘어가는가() {
        //given
        sut.leftStack = [1.0, 2.0, 3.0]
        sut.rightStack = []
        sut.enQueue(4.0)
        sut.deQueue()
        //when
        let result = [4.0, 3.0, 2.0]
        //then
        XCTAssertEqual(result, sut.rightStack)
    }
    
    func test_오른쪽스택이_비어있을때_deQueue를호출하면_값이제대로_넘어가는가() {
        //given
        sut.leftStack = [1.0, 2.0, 3.0]
        sut.rightStack = []
        //when
        sut.deQueue()
        let result = [3.0, 2.0]
        //then
        XCTAssertEqual(result, sut.rightStack)
    }
}
