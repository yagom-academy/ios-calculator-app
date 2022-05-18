//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Gordon Choi on 2022/05/17.
//

import XCTest
@testable import Calculator

struct CalculateItemTester: CalculateItem {
    let value: Int
}

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<CalculateItemTester>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CalculatorItemQueue<CalculateItemTester>(
            array: [CalculateItemTester(value: 1),
                    CalculateItemTester(value: 2),
                    CalculateItemTester(value: 3)]
        )
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_isEmpty가_제대로_작동하는지() {
        let result = sut.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_peek가_첫번째원소를_보여주는지() {
        let result = sut.peek?.value
        
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue로_큐의첫번째원소를_뺄수있는지() {
        let result = sut.dequeue()?.value
        
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue로_큐에_원소를_더할수있는지() {
        sut.enqueue(CalculateItemTester(value: 5))
        for _ in 0...2 {
            sut.dequeue()
        }
        
        let result = sut.peek?.value
        
        XCTAssertEqual(result, 5)
    }
}
