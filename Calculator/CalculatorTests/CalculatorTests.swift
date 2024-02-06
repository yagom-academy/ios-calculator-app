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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = CalculatorItemQueue()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_큐_요소개수파악이되는지테스트() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        //given
        sut.enqueue("3")
        let expection = 1
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(expection, result)
    }
    
    func test_큐_모든요소제거되는지테스트() {
        //given
        sut.enqueue("2")
        sut.enqueue("4")
        let expection = false
        
        //when
        let result: Bool = sut.isEmpty
        
        //then
        XCTAssertEqual(expection, result)
    }

    func test_큐_요소추가하기() {
        //given
        sut.enqueue("2")
        let expectation: [String] = ["2"]
        
        //when
        let result = sut.showQueue()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐_요소제거하기_FirstOut() {
        //given
        sut.enqueue("2")
        sut.enqueue("+")
        sut.enqueue("3")
        let expectation = "+"
        sut.dequeue()
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐_숫자연산자_차례대로_연샨테스트() {
        //given
        sut.enqueue("2")
        sut.enqueue("+")
        sut.enqueue("5")
        sut.enqueue("-")
        sut.enqueue("6")
        sut.enqueue("*")
        sut.enqueue("2")
        sut.enqueue("/")
        sut.enqueue("2")
        let expectation = "1"
        
        //when
        sut.calculateOperations()
        let result = sut.showValueOfOperations()
        
        //then
        XCTAssertEqual(result, expectation)
        
    }

}
