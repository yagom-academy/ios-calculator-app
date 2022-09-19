//
//  CalculatorItemQueue.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/19.
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
    
    func test_push50개_잘_들어가는지() {
        for _ in 1...50 {
            sut.push("test")
        }
        
        XCTAssertEqual(sut.queue.count, 50)
    }
    
}
