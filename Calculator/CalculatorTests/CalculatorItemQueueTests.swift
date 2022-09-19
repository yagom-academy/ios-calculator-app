//
//  CalculatorItemQueueTests.swift
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
    
    func test_push50개_이후_pop50개() {
        for _ in 1...50 {
            sut.push("test")
        }
        
        XCTAssertEqual(sut.queue.count, 50)
        
        for _ in 1...50 {
            let data = sut.pop()
            XCTAssertNotNil(data)
        }
        
        XCTAssertEqual(sut.queue.count, 0)
    }
    
    func test_비어있는상태에서_pop_하면_nil() {
        let data = sut.pop()
        
        XCTAssertNil(data)
    }
}
