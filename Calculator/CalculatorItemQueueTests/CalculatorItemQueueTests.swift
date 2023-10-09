//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박기석 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>(enqueueBox: [], dequeueBox: [])
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isEmpty프로퍼티를확인할시_비어있을때_True반환() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }

    func test_isEmpty프로퍼티를확인할시_요소가하나라도있을때_False를반환한다() {
        //given
        sut = .init(enqueueBox: [1], dequeueBox: [])
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_아무것도없을때_count프로퍼티를확인할시_count가0이출력된다() {
        //given
        sut = .init(enqueueBox: [], dequeueBox: [])
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_count프로퍼티를확인할때_요소가한개들어있을시_count가1이출력된다() {
        //given
        sut = .init(enqueueBox: [1], dequeueBox: [])
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_peek프로퍼티를확인할때_1과2와3이들어있을시_1이나온다() {
        //given
        sut = .init(enqueueBox: [1, 2, 3], dequeueBox: [])
        
        //when
        let result = sut.peek
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_1과28과9가있을때_17을enqueue할시_enqueueBox에1과28과9와17이들어있다() {
        //given
        sut = .init(enqueueBox: [1, 28, 9], dequeueBox: [])
        let expectedEnqueueBox = [1, 28, 9, 17]
        
        //when
        sut.enqueue(17)
        
        //then
        XCTAssertEqual(sut.enqueueBox, expectedEnqueueBox)
    }
    
    func test_1과77과28과9와17로초기화를하고_dequeue호출했을때_1이나온다() {
        //given
        sut = .init(enqueueBox: [1,77,28,9,17], dequeueBox: [])
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈배열에서dequeue호출시nil을반환하는지() {
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_여러요소를넣고_clear호출시_모두초기화되는지() {
        // given
        sut = .init(enqueueBox: [1, 2, 3], dequeueBox: [77, 28, 9])
        let expectedEnqueueBox = [Int]()
        let expectedDequeueBox = [Int]()
        
        //when
        sut.clear()
        
        //then
        XCTAssertEqual(expectedDequeueBox, sut.dequeueBox)
        XCTAssertEqual(expectedEnqueueBox, sut.enqueueBox)
    }

}
