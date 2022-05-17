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
    
    func test_입력이제대로들어가는지() throws {
        let test = [5, 6, 8, 9] as [Int]
        
        var testqueue = CalculatorItemQueue<Any>()
        
        testqueue.enqueue(test)
        var testList: [Any]
    
        if testqueue.linkedList.head?.next != nil {
            testList.append(<#T##newElement: Any##Any#>)
        }
        
        XCTAssertEqual(testqueue.linkedList.head?.data as! [Int] , [5, 6, 8, 10])
    }
}
