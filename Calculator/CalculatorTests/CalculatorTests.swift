//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/5/24.
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

    func test_큐_요소개수파악이되는지테스트() throws {
        sut.enqueue("3")
        let expection = 1
        
        let result = sut.count
        
        XCTAssertEqual(expection, result)
    }
    
    func test_큐_비어있는상태인지테스트() {
        sut.enqueue("2")
        sut.enqueue("4")
        let expection = false
        
        let result: Bool = sut.isEmpty
        
        XCTAssertEqual(expection, result)
    }

    func test_큐_요소추가하기() {
        sut.enqueue("2")
        let expectation: [String] = ["2"]
        
        let result = sut.showQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐_요소제거하기_FirstOut() {
        sut.enqueue("2")
        sut.enqueue("+")
        sut.enqueue("3")
        let expectation = "+"
        sut.dequeue()
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
}
