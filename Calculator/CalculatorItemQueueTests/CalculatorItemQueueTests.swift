//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Yetti on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
   
    func test_enQueue에String값Hi를넣었을때_queue에String값Hi를저장한다() {
        sut.queue += ["Hi"]
        let expectation = "Hi"
        
        let result: String = sut.queue[0]
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_deQueue호출시_queue에요소가있다면_0번째인덱스값을반환한다() {
        sut.queue = ["1", "2", "3", "4", "5"]
        let expectation = "1"
        
        let result = sut.deQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_deQueue호출시_queue가비어있다면_nil을반환한다() {
        sut.queue = []
        
        let result = sut.deQueue()
        
        XCTAssertNil(result)
    }
    
    func test_peek호출시_queue에0번인덱스값을_삭제하지않고반환한다() {
        sut.queue = ["1", "2", "3", "4", "5"]
        let expectation = "1"
        
        let result = sut.peek()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek호출시_queue가비어있다면_nil을반환한다() {
        sut.queue = []
        
        let result = sut.peek()
        
        XCTAssertNil(result)
    }
    
    func test_clear호출시_queue의요소들을_모두지운다() {
        sut.queue = ["1", "2", "3", "4", "5"]
        let expectation: [String] = []
        
        sut.clear()
        
        XCTAssertEqual(sut.queue, expectation)
    }
}
