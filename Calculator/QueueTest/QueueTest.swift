//  QueueTest.swift
//  Created by 레옹아범 on 2023/01/24.

import XCTest
@testable import Calculator

final class QueueTest: XCTestCase {
    
    var sut: Queue?

    override func setUpWithError() throws {
        sut = Queue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Queue가_처음_생성되면_head와_tail이_nil이다() {

    }
    
    func test_Queue가_비어있을때_isEmpty프로퍼티는_true이다() {

    }
    
    func test_Queue가_비어있지않으면_isEmpty프로퍼티는_false이다() {

    }
    
    func test_Queue가_비어있을때_값을_추가하면_head와_tail은_같은_Node를_가진다() {

    }
    
    func test_Queue에_node를_하나씩_넣는다면_tail에_들어간다() {

    }
    
    func test_Queue가_2개일_경우_head의_next는_tail을_가리킨다() {

    }
    
    func test_Queue가_2개일_경우_tail의_prev는_head를_가리킨다() {

    }
    
    func test_Queue가_3개일경우_tail의_prev와_head의_next는_같은_값을_가리킨다() {

    }
    
    func test_Queue가_2개이상일_경우_tail의_next는_항상_head를_가리킨다() {

    }
    
    func test_비어있는_Queue를_dequeue할_경우_nil을_반환한다() {
        let headNode = sut!.head
        
        XCTAssertNil(headNode)
    }
    
    func test_3개_Node를_가진_Queue를_dequeue_할_경우_head값을_반환한다() {

    }
    
    func test_3개_Node를_가진_Queue를_3번_반환할_경우_들어간_순서대로_dequeue값이_나온다() {
    }
    
    func test_Queue의_removeAll메소드를_사용할경우_head와_tail은_nil값이_된다() {

    }
}
