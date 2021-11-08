//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박병호 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    func test_빈_큐에_1을_삽입하면_1이_남는다() {
        let queue = CalculatorItemQueue<Int>()
        queue.enQueue(1)
        XCTAssertEqual(queue.returnQueue(), [1])
    }
    
    func test_1이_있는_큐에_2를_삽입하면_1과_2가_남는다() {
        let queue = CalculatorItemQueue<Int>()
        queue.enQueue(2)
        XCTAssertEqual(queue.returnQueue(), [1, 2])
    }
    
//    func test_1이_있는_큐를_삭제하면_빈_큐가_된다() {
//        let queue = CalculatorItemQueue()
//        queue.deQueue()
//        //XCTAssertTrue(stack.items.isEmpty)
//    }
//
//    func test_1과2가_있는_큐를_삭제하면_2가_남는다() {
//        let queue = CalculatorItemQueue()
//        queue.deQueue()
//        //XCTAssertEqual(stack.items, [1])
//    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
