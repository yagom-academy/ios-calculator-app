//
//  QueueTests.swift
//  QueueTests
//
//  Created by 김동욱 on 2022/03/15.
//

import XCTest
@testable import Calculator

extension Double: CalculateItem {
}

class QueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enQueue큐_배열에_값이_추가가_되는지() {
        sut.enQueue(element: 1)
        sut.enQueue(element: 2)
        sut.enQueue(element: 3)
        let result:[Double] = [1, 2, 3]
        XCTAssertEqual(sut.list, result)
    }
    
    func test_resetQueue큐_배열의_값이_제거가되는지() {
        sut.enQueue(element: 1)
        sut.resetQueue()
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_isEmpty_프로퍼티에_값을_넣었을때_False_값을_반환하는지() {
        let calculateItem = 0.35
        sut.enQueue(element: calculateItem)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_isEmpty_프로퍼티에_값을_넣었을때_True_값을_반환하는지() {
        XCTAssertTrue(sut.isEmpty)
    }
}
