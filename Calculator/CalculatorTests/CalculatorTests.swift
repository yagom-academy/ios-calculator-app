//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 맹선아 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue! = CalculatorItemQueue()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue메서드_itemQueue가비어있을때_10을추가해주면_haed가10이다() {
        //given ItemQueue가 비어있을 때
        sut.itemQueue.head = nil
        
        //when 10을추가해주면
        sut.enqueue("10")
        
        //then ItemQueue의 head가10입니다.
        XCTAssertEqual("10", sut.itemQueue.head?.data)
    }
    
    func test_enqueue메서드_itemQueue가비어있지않을때_10을추가해주면_마지막노드가10이다() {
        //given ItemQueue에 Node 1을 갖고있을 때
        sut.enqueue("1")
        
        //when 2를 추가해주면
        sut.enqueue("2")
        
        //then ItemQueue의 마지막 Node가 2이다.
        XCTAssertEqual("2", sut.itemQueue.head?.next?.data)
    }
    
    func test_dequeue메서드_itemQueue가비어있을때사용하면_여전히head가nil이다() {
        //given ItemQueue가 비어있을 때
        sut.itemQueue.head = nil
        
        //when dequeue메서드를 호출하면
        sut.dequeue()
        
        //then ItemQueue의 head가 여전히 nil입니다
        XCTAssertNil(sut.itemQueue.head)
    }
    
    func test_dequeue메서드_itemQueue가비어있지않을때_제일앞Node를지워준다() {
        //given ItemQueue가 1,2,3을 갖고있을때
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        //when dequeue메서드를 호출하면
        sut.dequeue()
        
        //then ItemQueue는 1이지워진 2,3을 갖고있다.
        XCTAssertEqual("2", sut.itemQueue.head?.data)
        XCTAssertEqual("3", sut.itemQueue.head?.next?.data)
        XCTAssertEqual(nil, sut.itemQueue.head?.next?.next?.data)
    }
    
    func test_confirmFirst_itemQueue가비어있을때_nil반환한다() {
        //given itemQueue가 비어있을 때
        sut.itemQueue.head = nil
        
        //when itemQuene의 first는
        let first = sut.confirmFirst()
        
        //then nil이다
        XCTAssertNil(first)
    }
    
    func test_confirmFirst_itemQueue가비어있지않을때_제일앞Node를반환한다() {
        //given itemQueue에 1, 2, 3이 있을 때
        sut.itemQueue.append("1")
        sut.itemQueue.append("2")
        sut.itemQueue.append("3")
        
        //when itemQuene의 first는
        let first = sut.confirmFirst()
        
        //then 1이다
        XCTAssertEqual("1", first)
    }
    
    func test_clear메서드_itemQueue를전부지워준다() {
        //given ItemQueue가 1,2,3을 갖고있을때
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        //when clear메서드를 호출하면
        sut.clear()
        
        //then ItemQueue가 전부 지워진다.
        XCTAssertEqual(nil, sut.itemQueue.head?.data)
        XCTAssertEqual(nil, sut.itemQueue.head?.next?.data)
        XCTAssertEqual(nil, sut.itemQueue.head?.next?.next?.data)
    }
}
