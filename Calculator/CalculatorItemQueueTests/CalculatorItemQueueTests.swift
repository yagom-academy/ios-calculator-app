//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Gordon Choi on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CalculatorItemQueue<Int>(array: [1, 2, 3, 4])
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
        let result = sut.peek
        
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue로_큐의첫번째원소를_뺄수있는지() {
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue로_큐에_원소를_더할수있는지() {
        sut.enqueue(5)
        for _ in 0...3 {
            sut.dequeue()
        }
        
        let result = sut.peek
        
        XCTAssertEqual(result, 5)
    }
}
