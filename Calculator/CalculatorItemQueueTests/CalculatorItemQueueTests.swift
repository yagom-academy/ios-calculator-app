//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by smfc on 19/9/2022.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count메서드에_숫자를넣었을때() {
        // given
        let input = [1, 2]
        
        // when
        let result = sut.count(of: input)
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_count메서드에_String이들어왔을때() {
        // given
        let input = ["+"]

        // when
        let result = sut.count(of: input)

        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_입력값이없을때_count메서드결과가0인지확인() {
        // given
        let input: [Int] = []
        
        // when
        let result = sut.count(of: input)
        
        // then
        XCTAssertEqual(result, 0)
    }
}
