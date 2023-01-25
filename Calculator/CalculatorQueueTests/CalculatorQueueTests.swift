//
//  CalculatorQueueTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/25.
//

import XCTest

import Foundation

final class CalculatorQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enequeueStackcount은_enqueueItem에_들어온_값의갯수를_반환한다() {
        
        sut.enqueueItem(2)
        sut.enqueueItem(3)
        sut.enqueueItem(7)
        
        let expectaiton = 3
        let result = sut.enequeueStackCount
        
        XCTAssertEqual(expectaiton, result)
    }
    
    func test_deequeueStackcount은_dequeueItem을_통해_전달받은_값의갯수를__반환한다() {
        
        sut.enqueueItem(3)
        sut.enqueueItem(4)
        sut.enqueueItem(13)
        
        let expectaiton = 2
        sut.dequeueItem()
        let result = sut.dequeueStackCount
        
        XCTAssertEqual(expectaiton, result)
    }
    
    func test_enqueueItem에_숫자값이_입력될_경우_enqueueStack에_순서대로_담긴다(){
        
        sut.enqueueItem(2)
        sut.enqueueItem(3)
        sut.enqueueItem(7)
        
        let result = sut.enqueueStack
        
        let expectation = [2,3,7]
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueStack에_값이_없을경우_dequeueItem실행시_enqueueStack의_값은_초기화된다() {
        
        let dequeueEmpty = sut.dequeueStack.isEmpty
        let enqueueEmpty = sut.enqueueStack.isEmpty
        sut.enqueueItem(2)
        sut.enqueueItem(3)
        
        let result = true
        
        if dequeueEmpty == true {
             sut.dequeueItem()
            enqueueEmpty == true
            XCTAssertEqual(result, enqueueEmpty)
        }
    }
    
    func test_dequeueStack에_값이_없을경우_dequeueItem은_enqueueStack의_값을_뒤집어저장하고_마지막값을_삭제한다() {
        
        let dequeueEmpty = sut.dequeueStack.isEmpty
        sut.enqueueItem(4)
        sut.enqueueItem(5)
        sut.enqueueItem(9)
        
        let expectation = [9,5]
        
        if dequeueEmpty == true {
            sut.dequeueItem()
            let result = sut.dequeueStack
            XCTAssertEqual(result, expectation)
        }
    }
    
    func test_dequeueStack에_값이_남아있을경우_enqueueStack과_dequeueStack은_별도로_존재한다() {
        
        sut.enqueueItem(3)
        sut.enqueueItem(7)
        sut.enqueueItem(13)
        
        sut.dequeueItem()
        
        sut.enqueueItem(4)
        sut.enqueueItem(9)
        
        let enqueueExpectation = [4,9]
        let dequeueExpectation = [13,7]
        
        let enqueueResult = sut.enqueueStack
        let dequeueResult = sut.dequeueStack
        
        XCTAssertEqual(enqueueExpectation, enqueueResult)
        XCTAssertEqual(dequeueExpectation, dequeueResult)
    }
}
    
    
    
