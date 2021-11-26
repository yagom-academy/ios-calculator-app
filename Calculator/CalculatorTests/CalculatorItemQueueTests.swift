//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_배열에서_Double타입_1을_enqueue하면_Double타입_1이_남는다() {
        var doubleSut: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
        
        doubleSut.enqueue(1.0)
        XCTAssertEqual(doubleSut.enqueueStack, [1.0])
    }
    
    func test_빈_배열에서_Character타입_더하기를_enqueue하면_연산자배열에_더하기가_생성되는지() {
        var operatorSut: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
        
        operatorSut.enqueue(.add)
        XCTAssertEqual(operatorSut.enqueueStack, [.add])
    }
    
    func test_배열에_값이_하나_들어있을_경우_dequeue를_하면_빈_배열로_되는지() {
        var operatorSut: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
        
        operatorSut.enqueue(.add)
        try? operatorSut.dequeue() 
        
        XCTAssertTrue(operatorSut.isEmpty)
    }
    
    func test_빈_Double배열에_dequeue를_하면_오류를_뱉는지() {
        var doubleSut: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
        
        XCTAssertNil(try doubleSut.dequeue())
    }
    
    func test_빈_Operator배열에_removeItem을_하면_오류를_뱉는지() {
        var operatorSut: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
        
        XCTAssertNil(try operatorSut.dequeue())
    }
}
