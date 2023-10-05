//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Lee minyeol on 2023/10/04.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue가비어있을때_isEmpty호출시_true를반환한다() {
        //given
        
        //when
        let result = sut.isEmpty
        //then
        XCTAssertTrue(result)
    }
    
    func test_1이queue에들어있을때_isEmpty호출시_false를반환한다() {
        //given
        sut.enqueue("1")
        //when
        let result = sut.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    func test_숫자가1과2와3이queue에들어있을떄_count호출시_개수3개가반환한다() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_빈배열인queue에_enqueue호출시숫자가3이들어오면_개수가1개가된다() {
        //given
        
        //when
        sut.enqueue("3")
        //then
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_queue비었을때_dequeue호출시_nil을반환한다() {
        //given
        
        //when
        let result = sut.dequeue()
        //then
        XCTAssertNil(result)
    }
    
    func test_4와5와6이queue들었을때_dequeue호출시_4을제거하면_개수가2개가된다() {
        //given
        sut.enqueue("4")
        sut.enqueue("5")
        sut.enqueue("6")
        //when
        XCTAssertEqual(sut.dequeue(), "4")
        //then
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_7과8과9가queue에들어있을떄_clear호출시배열이제거되면_ture를반환한다() {
        //given
        sut.enqueue("7")
        sut.enqueue("8")
        sut.enqueue("9")
        //when
        sut.clear()
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
