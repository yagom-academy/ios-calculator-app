//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 우롱차 on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func test_inque_CalculatorItemQueue() {
        //given
        let calculatorItemQueue = CalculatorItemQueue()
        
        //when
        calculatorItemQueue.enqueue(number: 3,operation: "+")
        
        //then
        let result: Bool
        let number = calculatorItemQueue.queue[0].number
        let plusString = calculatorItemQueue.queue[0].operation
        if number == 3 && plusString == "+" {
            result = true
        } else {
            result = false
        }
        XCTAssertTrue(result)
    }
    
    func test_deque_CalculatorItemQueue() {
        //given
        let calculatorItemQueue = CalculatorItemQueue()
        calculatorItemQueue.enqueue(number: 3,operation: "+")
        calculatorItemQueue.enqueue(number: 2,operation: "-")
        
        //when
        let dequeResult = calculatorItemQueue.dequeue()
        
        //then
        let result: Bool
        let number = dequeResult.number
        let plusString = dequeResult.operation
        if number == 3 && plusString == "+" {
            result = true
        } else {
            result = false
        }
        XCTAssertTrue(result)
    }
    
    func test_deque_twice_CalculatorItemQueue() {
        //given
        let calculatorItemQueue = CalculatorItemQueue()
        calculatorItemQueue.enqueue(number: 3,operation: "+")
        calculatorItemQueue.enqueue(number: 2,operation: "-")
        
        //when
        _ = calculatorItemQueue.dequeue()
        let dequeResult2 = calculatorItemQueue.dequeue()
        
        //then
        let result: Bool
        let number = dequeResult2.number
        let plusString = dequeResult2.operation
        if number == 2 && plusString == "-" {
            result = true
        } else {
            result = false
        }
        XCTAssertTrue(result)
    }
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
