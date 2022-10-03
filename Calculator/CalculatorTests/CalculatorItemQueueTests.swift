//
//  CalculatorTests.swift
//  Created by Wonbi
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Queue가빈값일때_true를반환하는지() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_Queue의남은데이터갯수를세는메서드가_정상작동하는지() {
        let input: [Double] = .init(repeating: Double.random(in: 1...100), count: Int.random(in: 1...100))
        
        for data in input {
            sut.enqueue(data)
        }
        let result = sut.count
        let inputCount = input.count
        
        XCTAssertEqual(result, inputCount)
    }
    
    func test_Queue에데이터를enqueue했을때_count가enqueue횟수와일치하는지() {
        let input: [Double] = .init(repeating: Double.random(in: 1...100), count: Int.random(in: 1...100))
        
        for data in input {
            sut.enqueue(data)
        }
        
        XCTAssertEqual(input.count, sut.count)
    }
    
    func test_Queue의데이터를dequeue했을때_FIFO가정상적으로일어나는지() {
        var input = [Double]()
        for data in 1...Int.random(in: 1...100) {
            
            sut.enqueue(Double(data))
            input.append(Double(data))
        }
        
        var result = [Double]()
        for _ in input {
            guard let data = sut.dequeue() else { return }
            result.append(data)
        }

        XCTAssertEqual(input, result)
    }
    
    func test_dequeue를호출한후count에접근할때_정상적으로data의갯수를반환하는지() {
        let input: [Double] = .init(repeating: Double.random(in: 1...100), count: Int.random(in: 1...50))
        for data in input {
            sut.enqueue(data)
        }

        let randomNumber = Int.random(in: 1...input.count)
        for _ in 1...randomNumber {
            sut.dequeue()
        }

        XCTAssertEqual(input.count - randomNumber, sut.count)
    }
    
    func test_enqueue와dequeue를동일한횟수로호출하면_data가비어있는지() {
        let randomNumber = Int.random(in: 1...50)

        for _ in 1...randomNumber {
            sut.enqueue(Double.random(in: 1...100))
        }

        for _ in 1...randomNumber {
            sut.dequeue()
        }

        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_Queue에랜덤한값을넣었을때_stateQueue프로퍼티가정상적으로연산되는지() {
        var expectedValue: [Double] = []
        
        for _ in 1...Int.random(in: 1...30) {
            let randomNumber: Double = Double.random(in: -100.0...100.0)
            
            sut.enqueue(randomNumber)
            expectedValue.append(randomNumber)
        }
        
        XCTAssertEqual(expectedValue, sut.statusQueue)
    }
}
