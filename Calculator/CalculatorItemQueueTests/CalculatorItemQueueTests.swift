//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 정선아 on 2022/09/19.
//

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
    
    func test_enQueue_메서드가_실행되었을_때_inputStack에_값이_들어가는가() {
        let input = 7.0
        
        sut.enQueue(element: input)
        
        let result = 7.0
        
        XCTAssertEqual(result, sut.inputStack.last)
    }
    
    func test_deQueue_메서드가_실행되었을_때_outputStack이_nil일_때_inputStack이_배열요소의_순서를_뒤집어_outputStack에_넣는가() {
        for i in 1...3 {
            sut.enQueue(element: Double(i))
        }
        
        if sut.outputStack.isEmpty {
            sut.outputStack = sut.inputStack.reversed()
        }
        
        let result = [3.0, 2.0, 1.0]
        
        XCTAssertEqual(result, sut.outputStack)
    }
    
    func test_deQueue_메서드가_실행되었을_때_inputStack의_순서를_뒤집어_outputStack에_넣고_inputStack의_요소를_모두_없애는가() {
        sut.inputStack = [1.0, 2.0, 3.0]
        sut.outputStack = sut.inputStack.reversed()
        
        if sut.inputStack.reversed() == sut.outputStack {
            sut.inputStack.removeAll()
        }
        
        let result = sut.inputStack
        
        XCTAssertEqual(result, [])
    }
    
    func test_deQueue_메서드가_호출되었을_때_outputStack의_마지막_요소를_반환하는가() {
        sut.inputStack = [1.0, 2.0, 3.0]
        sut.outputStack = sut.inputStack.reversed()
        
        let result = try? sut.deQueue()
        
        XCTAssertEqual(result, 1.0)
    }
    
    func test_outputStack이_nil일_때_enQueue_메서드를_호출하고_deQueue_메서드를_호출하면_값을_잘_반환하는가() {
        sut.inputStack = [1.0, 2.0, 3.0]
        sut.outputStack = []
        sut.enQueue(element: 4.0)
        
        let result = try? sut.deQueue()
        
        XCTAssertEqual(result, 1.0)
    }
}
