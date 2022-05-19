//
//  Test_Calculator.swift
//  Test_Calculator
//
//  Created by 허건 on 2022/05/16.
//

import XCTest

class Test_Calculator: XCTestCase {

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
    
    func test_5689배열이제대로들어가는지() throws {
        let test = 5 as Int
        
        var testqueue = CalculatorItemQueue<Any>()
        
        testqueue.enqueue(test)
        testqueue.enqueue(test)
        testqueue.enqueue(test)

        XCTAssertEqual(testqueue.linkedList.head?.data as! Int , 5)
    }
    
    func test_첫번째값이제거되는지() throws {
        
        var testqueue = CalculatorItemQueue<Any>()
        testqueue.enqueue(5)
        testqueue.enqueue(6)

        testqueue.dequeue()
        
        XCTAssertEqual(testqueue.linkedList.head?.data as! Int, 6)
    }
    
    func test_값들이전체삭제가되는지() throws {
        
        var testqueue = CalculatorItemQueue<Any>()
        testqueue.enqueue(5)
        testqueue.enqueue(6)

        testqueue.clear()
        
        XCTAssertEqual(testqueue.linkedList.head?.data as? String, nil)
        
    }
}
