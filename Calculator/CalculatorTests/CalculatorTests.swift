//
//  CalculatorTests.swift
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
        let input: [CalculateItem] = .init(repeating: Double.random(in: 1...100), count: Int.random(in: 1...100))
        
        sut.input = input
        let result = sut.count
        let inputCount = input.count
        
        XCTAssertEqual(result, inputCount)
    }
    
    func test_Queue에데이터를enqueue했을때_count가enqueue횟수와일치하는지() {
        let input: [CalculateItem] = .init(repeating: Double.random(in: 1...100), count: Int.random(in: 1...100))
        
        for data in input {
            sut.enqueue(data)
        }
        
        XCTAssertEqual(input.count, sut.count)
    }
    
    func test_Queue의데이터를dequeue했을때_FIFO가정상적으로일어나는지() {
        var input = [Int]()
        for data in 1...Int.random(in: 1...100) {
            sut.enqueue(data)
            input.append(data)
        }
        
        var result = [Int]()
        for _ in input {
            guard let data = sut.dequeue() as? Int else { return }
            result.append(data)
        }

        XCTAssertEqual(input, result)
    }
}
