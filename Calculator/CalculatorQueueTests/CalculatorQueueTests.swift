//
//  CalculatorQueueTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/09.
//

import XCTest
@testable import Calculator
class CalculatorQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_calculatorItemQueue_item이_들어올경우_내부저장소에_저장이되는지() {
        sut.enqueue(operation: "+")
        let operationCount = sut.operationStorage.count

        XCTAssertEqual(operationCount, 1)
    }
    
    func test_calculatorItemQueue_item이_2개_또는_그이상이_들어올경우_내부저장소에_저장이되는지() {
        sut.enqueue(operation: "-")
        sut.enqueue(operation: "+")
        let operationCount = sut.operationStorage.count

        XCTAssertEqual(operationCount, 2)
    }
    
    func test_calculatorItemQueue_item이_내부저장소에_순서대로_저장되는지() {
        sut.enqueue(operation: "-")
        sut.enqueue(operation: "+")
        sut.enqueue(operation: "=")
        
        var testArr: [String] = []
        testArr.append(sut.operationStorage.removeFirst())
        
        XCTAssertEqual(testArr[0], "-")
    }
    
    func test_calculatorItemQueue_item을_내부저장소에서_제대로_반환하는지() {
        sut.enqueue(operation: "-")
        let operationData = sut.dequeue()
        
        XCTAssertEqual(operationData, "-")
    }
    
    func test_calculatorItemQueue_item이_2개_또는_그이상이_들어올경우_먼저온순서대로_반환하는지() {
        sut.enqueue(operation: "+")
        sut.enqueue(operation: "-")
        let operationData = sut.dequeue()
        
        XCTAssertEqual(operationData, "+")
    }
    
    func test_calculatorItemQueue_item이_비어있을경우_nil_반환하는지() {
        let operationData = sut.dequeue()
        
        XCTAssertNil(operationData)
    }
    
    func test_calculatorItemQueue_item이_추가되었다가_다빠질경우_nil_반환하는지() {
        sut.enqueue(operation: "+")
        sut.dequeue()
        let operationData = sut.dequeue()
        
        XCTAssertNil(operationData)
    }
}

extension String: CalculatorItem { }
