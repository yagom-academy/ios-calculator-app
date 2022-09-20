//
//  CalculatorItemQueueTests.swift
//  Created by 미니.
//

/* 초기 테스트 설정
 1. enque를 하면 값이 저장된다.
 2. deque를 하면 처음으로 저장한 값이 나온다.
 3. enque와 deque의 횟수가 동일하면 isEmpty의 프로퍼티가 true를 반환한다.
 */

/* 구현 후 테스트 변경
 1. enque를 하면 isEmpty의 값이 false를 반환한다.
 2. deque를 하면 처음으로 저장한 값이 나온다.
 3. enque와 deque의 횟수가 동일하면 isEmpty의 프로퍼티가 true를 반환한다.
 */

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_값을넣으면_isEmpty가_true인가() {
        sut.enqueue(1)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_값을_추출하면_마지막에_저장한_값이_나오는가() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let result = sut.peek(2)
        
        XCTAssertEqual(result, 1)
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
