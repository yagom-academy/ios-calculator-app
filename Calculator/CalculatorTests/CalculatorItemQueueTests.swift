//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {

    func test_기존_연산큐에_데이터가_없을때_계산기가_입력받은_1와_더하기_연산자는_연산큐에_쌓이는가() {
        let calculatorItemQueue = CalculatorItemQueue()
        
        calculatorItemQueue.enqueue(1.0, "+")
        
        XCTAssertEqual((1.0, "+"), (calculatorItemQueue.computingValueList.first,
                                    calculatorItemQueue.operatorsList.first))
    }
    
    func test_기존_연산큐에_데이터가_있을때_제대로_쌓이는가() {
        
    }
    
    func test_연산큐에_데이터가_존재할때_dequeue_기능이_잘_되는가() {
        
    }
    
    func test_연산큐에_있는_모든_데이터를_지우는_기능이_잘_되는가() {
        
    }
    
    
}
