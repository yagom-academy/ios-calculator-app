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
        sut.enQueue(operation: "+")
        let operationCount = sut.operationStorage.count

        XCTAssertEqual(operationCount, 1)
    }
    
    func test_calculatorItemQueue_item이_2개_또는_그이상이_들어올경우_내부저장소에_저장이되는지() {
        sut.enQueue(operation: "-")
        sut.enQueue(operation: "+")
        let operationCount = sut.operationStorage.count

        XCTAssertEqual(operationCount, 2)
    }
    
    func test_calculatorItemQueue_item이_내부저장소에_순서대로_저장되는지() {
        sut.enQueue(operation: "-")
        sut.enQueue(operation: "+")
        sut.enQueue(operation: "=")
        
        var testArr: [String] = []
        testArr.append(sut.operationStorage.removeFirst())
        
        XCTAssertEqual(testArr[0], "-")
    }
    
    func test_calculatorItemQueue_item을_내부저장소에서_제대로_반환하는지() {
        sut.enQueue(operation: "-")
        let operationData = sut.deQueue()
        
        XCTAssertEqual(operationData, "-")
    }
    
    func test_calculatorItemQueue_item이_2개_또는_그이상이_들어올경우_먼저온순서대로_반환하는지() {
        sut.enQueue(operation: "+")
        sut.enQueue(operation: "-")
        let operationData = sut.deQueue()
        
        XCTAssertEqual(operationData, "+")
    }
    
    func test_calculatorItemQueue_item이_비어있을경우_nil_반환하는지() {
        let operationData = sut.deQueue()
        
        XCTAssertNil(operationData)
    }
    
    func test_calculatorItemQueue_item이_추가되었다가_다빠질경우_nil_반환하는지() {
        sut.enQueue(operation: "+")
        sut.deQueue()
        let operationData = sut.deQueue()
        
        XCTAssertNil(operationData)
    }
    
    func test_calculatorItemQueue_item이_한번에_제거되는지() {
        sut.operationStorage.append("+")
        sut.operationStorage.append("=")
        sut.removeAllItem()
        let operationCount = sut.operationStorage.count
        
        XCTAssertEqual(operationCount, 0)
    }
    
    func test_calculatorItemQueue가_빈경우에_모두_제거할경우_정상작동하는지() {
        sut.removeAllItem()
        let operationRemoveAllTest = sut.operationStorage.count
        
        XCTAssertEqual(operationRemoveAllTest, 0)
    }
}

extension String: CalculatorItem { }
