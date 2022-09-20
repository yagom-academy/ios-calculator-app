//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by junho lee on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기2를_enqueue하고_dequeue하면_1더하기2가_그대로나오는지() {
        let input: Array<String> = ["1", "+", "2"]
        
        input.forEach { sut.enqueue($0) }
        var result: Array<String> = []
        for _ in 0...2 {
            if let returnValue = sut.dequeue() {
                result.append(returnValue)
            }
        }
        
        XCTAssertEqual(result, input)
    }
}
