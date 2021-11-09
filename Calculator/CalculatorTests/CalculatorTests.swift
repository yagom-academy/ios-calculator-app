//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var queue: CalculatorItemQueue = CalculatorItemQueue()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testQueueListisnotEmpty() {
        XCTAssertEqual(queue.queueList.isEmpty, false)
    }
    
    func testQueueListappend() {
        queue.append(item: "2")
        
        XCTAssertEqual(queue.queueList, ["1","2"])
    }
    
    func testQueueSort() {
        queue.append(item: "2")
        queue.append(item: "1")
        
        XCTAssertEqual(queue.queueList, ["1","1","2"])
    }
    
}
