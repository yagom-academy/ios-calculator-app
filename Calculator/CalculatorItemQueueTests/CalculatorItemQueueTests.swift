//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/09.
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
    
    func test_enQueue에_요소를_추가했을때_잘들어가는지() {
        sut.enQueueElement(1)
        
        XCTAssertEqual(sut.enQueueElements, [1])
    }
    
    func test_enQueue에_여러개의_요소를_추가했을때_잘들어가는지() {
        sut.enQueueElement(1)
        sut.enQueueElement(2)
        sut.enQueueElement(3)
        
        XCTAssertEqual(sut.enQueueElements, [1, 2, 3])
    }
    
    func test_deQueue를_실행했을때_빈배열이면_에러를던지는지() {
        XCTAssertThrowsError(try sut.deQueueFirstElement())
    }
    
    func test_enQueue에_요소여러개를_추가하고_deQueue했을때_마지막요소가_빠지는지() {
        sut.enQueueElement(1)
        sut.enQueueElement(2)
        sut.enQueueElement(3)
        
        XCTAssertEqual(try sut.deQueueFirstElement(), 1)
    }    
}
