//
//  CalculatorItemQueueTests.swift
//  Created by 미니.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = CalculatorItemQueue()
    }
    /* 초기 테스트 설정
     1. enque를 하면 값이 저장된다.
     2. deque를 하면 마지막으로 저장한 값이 나온다.
     3. enque와 deque의 횟수가 동일하면 isEmpty의 프로퍼티가 true를 반환한다.
     */
    
    func test_값을넣으면_값이저장되는가() {
        let result = sut.enqueue(1)
        XCTAssertTrue(result)
    }
    
    func test_값을_추출하면_마지막에_저장한_값이_나오는가() {
        let _ = sut.enqueue(1)
        let result = sut.dequeue()
        
        XCTAssertNotNil(result)
    }
    
    func test_값을_넣는_횟수와_추출하는_횟수가_같으면_배열이_비어있는가() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        
        XCTAssertTrue(sut.isEmpty)
    }
}
