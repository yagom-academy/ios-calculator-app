//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 노유빈 on 2022/09/21.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func generateRandomCalculateItem() -> [CalculateItem] {
        var calculateItems: [CalculateItem] = []
        
        for _ in 1...50 {
            let randomDouble = Double.random(in: 0...1)
            let randomOperate = Operator.allCases.randomElement()!
            
            calculateItems.append(randomDouble)
            calculateItems.append(randomOperate)
        }
        
        return calculateItems
    }
    
    func pushCalculateItems(_ calculateItems: [CalculateItem]) {
        for calculateItem in calculateItems {
            sut.push(calculateItem)
        }
    }
    
    func isEqualCalculateItem(_ item1: CalculateItem, _ item2: CalculateItem) -> Bool {
        if let item1 = item1 as? Double {
            if item1 == item2 as? Double { return true }
        } else if let item1 = item1 as? Operator {
            if item1 == item2 as? Operator { return true }
        }
        
        return false
    }
    
    func test_calculateItems를_push한_순서대로_pop이_되는지_확인() {
        let calculateItems = generateRandomCalculateItem()
        var result = true
        
        pushCalculateItems(calculateItems)
        
        for calculateItem in calculateItems {
            guard let poppedItem = sut.pop() else { return }
            
            if !isEqualCalculateItem(calculateItem, poppedItem) {
                debugPrint("\(calculateItem), \(poppedItem), \(sut.count)")
                result = false
                break
            }
            
            debugPrint("\(calculateItem), \(poppedItem), \(sut.count)")
        }
        
        XCTAssert(result)
    }
    
    func test_비어있는_큐에_pop_하면_nil을_반환하는지_확인() {
        let calculateItem: CalculateItem?
        
        calculateItem = sut.pop()
        
        XCTAssertNil(calculateItem)
    }
}
