////
////  CalculatorItemQueueTests.swift
////  Created by 미니.
////
//
//import XCTest
//@testable import Calculator
//
//class CalculatorItemQueueTests: XCTestCase {
//    var sut: CalculatorItemQueue<Double>!
//    var testNumber: Double!
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        sut = CalculatorItemQueue()
//        testNumber = Double.random(in: 1...100)
//    }
//    
//    override func tearDownWithError() throws {
//        try super.tearDownWithError()
//        sut = nil
//        testNumber = nil
//    }
//
//    func test_초기화를통해서_빈큐를_초기화할수있는가() {
//        // given
//        let queue = CalculatorItemQueue<Double>()
//
//        // when
//        let result = queue.isEmpty
//
//        // then
//        XCTAssertTrue(result)
//    }
//
//    func test_초기화와_배열을_통해서_채워져_있는_큐를_생성할_수_있는가() {
//        // given
//        let initArr: [Double] = [1,2,3,4]
//        let queue = CalculatorItemQueue(elements: initArr)
//
//        // when
//        let result = !queue.isEmpty
//
//        // then
//        XCTAssertTrue(result)
//    }
//
//    func test_enqueue로_요소을_추가하면_제일_처음에_나올_값이_추가한_요소와_동일한가() {
//        // given
//        sut.enqueue(testNumber)
//
//        // when
//        let result = sut.front
//
//        // then
//        XCTAssertEqual(testNumber, result)
//    }
//
//    func test_여러번의_enqueue로_요소를_추가한후_큐의_요소개수와_동일한가() {
//        // given
//        let count = Int(testNumber)
//        for value in 0..<count {
//            let enqueueNumber = Double(value)
//            sut.enqueue(enqueueNumber)
//        }
//
//        // when
//        let result = sut.count
//
//        // then
//        XCTAssertEqual(result, count)
//    }
//
//    func test_enqueue로_요소를_추가하고_dequeue실행으로_나오는값이_추가한요소와_동일한가() {
//        // given
//        sut.enqueue(testNumber)
//
//        // when
//        let result = sut.dequeue()
//
//        // then
//        XCTAssertEqual(testNumber, result)
//    }
//
//}
