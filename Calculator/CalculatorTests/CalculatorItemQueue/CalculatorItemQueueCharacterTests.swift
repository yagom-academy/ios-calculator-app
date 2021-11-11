//
//  CalculatorItemQueueCharacterTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/11.
//

import XCTest

class CalculatorItemQueueCharacterTests: XCTestCase {

    var sutQueue: CalculatorItemQueue<Character>?

    override func setUpWithError() throws {
        sutQueue = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sutQueue = nil
    }
    
    func test_빈_큐에_문자_덧셈기호를_enqueue하고_dequeue하면_문자_덧셈기호를_반환하는가() {
        // given
        sutQueue?.enqueue(Character("+"))
        // when
        let result = sutQueue?.dequeue()
        // then
        XCTAssertEqual(result, Character("+"))
    }
    
    func test_빈_큐에서_isEmpty하면_true를_반환하는가() {
        // given
        // when
        let result = sutQueue?.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_문자_덧셈기호만_들어있는_큐에서_isEmpty하면_false를_반환하는가() {
        // given
        sutQueue?.enqueue("+")
        // when
        let result = sutQueue?.isEmpty
        // then
        XCTAssertEqual(result, false)
    }
}

extension Character: CalculateItem { }
