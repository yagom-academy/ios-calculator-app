//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Wonbi on 2022/09/19.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Queue가빈값일때_true를반환하는지() {
        let input: [CalculateItem] = []
        
        sut.input = input
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_Queue의남은데이터갯수를세는메서드가_정상작동하는지() {
        let input: [CalculateItem] = .init(repeating: Double.random(in: 1...30), count: Int.random(in: 1...30))
        
        sut.input = input
        let result = sut.count
        let inputCount = input.count
        
        XCTAssertEqual(result, inputCount)
    }
}

// FIFO가 제대로 동작하는지
// enqueue메서드를 실행했을 때 제대로 값이 들어가는지
// dequeue메서드를 실행했을 때 제대로 값이 나오는지
