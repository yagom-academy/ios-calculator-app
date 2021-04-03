//
//  StackTests.swift
//  StackTests
//
//  Created by ysp on 2021/04/03.
//

import XCTest
@testable import Calculator
class StackTests: XCTestCase {
    
    var stackDecimalTest = Stack<Double>()
    var stackBinaryTest = Stack<Int>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        test_stack_pop()
        test_stack_pop_error()
        test_stack_top()
        test_stack_isEmpty()
    }
    
    func test_stack_pop() {
        stackDecimalTest = Stack<Double>(list:[1, 2])
        XCTAssertEqual(try stackDecimalTest.pop(), 2)
    }
    
    func test_stack_pop_error() {
        stackDecimalTest = Stack<Double>()
        XCTAssertThrowsError(try stackDecimalTest.pop()) { (error) in
            XCTAssertEqual(error as! StackError, StackError.poppedItemIsNil)
        }
    }
    
    func test_stack_top() {
        stackDecimalTest = Stack<Double>(list:[1, 2])
        XCTAssertEqual(try stackDecimalTest.top(), 2)
    }
    
    func test_stack_isEmpty() {
        stackDecimalTest = Stack<Double>()
        XCTAssertEqual(stackDecimalTest.isEmpty, true)
    }
}
