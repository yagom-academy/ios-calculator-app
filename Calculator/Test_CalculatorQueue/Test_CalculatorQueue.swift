//
//  Test_Calculator.swift
//  Test_Calculator
//
//  Created by 허건 on 2022/05/16.
//

import XCTest
@testable import Calculator

class Test_Calculator: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_5689배열이제대로들어가는지() throws {
        // given
        let test = 5 as Int
        
        var testqueue = CalculatorItemQueue<Int>()
        
        // when
        testqueue.enqueue(test)
        testqueue.enqueue(test)
        testqueue.enqueue(test)
        
        // then
        let result = testqueue.linkedList.head?.data
        
        XCTAssertEqual(result, 5)
    }
    
    func test_첫번째값이제거되는지() throws {
        
        var testqueue = CalculatorItemQueue<Any>()
        testqueue.enqueue(5)
        testqueue.enqueue(6)

        testqueue.dequeue()
        
        XCTAssertEqual(testqueue.linkedList.head?.data as! Int, 6)
    }
    
    func test_요소들이전체삭제가되는지() throws {
        
        var testqueue = CalculatorItemQueue<Any>()
        testqueue.enqueue(5)
        testqueue.enqueue(6)

        testqueue.clear()
        
        XCTAssertEqual(testqueue.linkedList.head?.data as? String, nil)
        
    }
    
    func test_Split이되는지() throws {
        
        let test: Character = "+" // Operator.rawvalue
        let test2: String = "3+3+3"
        test2.filter(<#T##isIncluded: (Character) throws -> Bool##(Character) throws -> Bool#>)
        let test3 = test2.split(with: test)  // [String]
        //let test4 = test3.map{&0}
        
        XCTAssertEqual(test3, ["3", "3"])
        
    }
}
