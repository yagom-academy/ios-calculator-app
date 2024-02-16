//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/5/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_큐_요소개수파악이되는지테스트() throws {
        let dummy = ["3"]
        dummy.forEach { sut.enqueue($0) }
        let expection = 1
        
        let result = sut.count
        
        XCTAssertEqual(expection, result)
    }
    
    func test_큐_비어있는상태인지테스트() {
        let dummy = ["3"]
        dummy.forEach { sut.enqueue($0) }
        let expection = false
        
        let result: Bool = sut.isEmpty
        
        XCTAssertEqual(expection, result)
    }

    func test_큐_요소추가하기() {
        let dummy = ["3"]
        dummy.forEach { sut.enqueue($0) }
        
        let expectation: [String] = dummy
        
        let result = sut.showQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐_요소제거하기_FirstOut() {
        let dummy = ["2", "+", "3"]
        dummy.forEach { sut.enqueue($0) }
        sut.dequeue()

        let expectation = "+"
        
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
}
