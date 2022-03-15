//
//  QueueTests.swift
//  QueueTests
//
//  Created by 김동욱 on 2022/03/15.
//

import XCTest
@testable import Calculator

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

    func test_first_프로퍼티가_큐배열의_처음_인덱스를_가르키는지() {
        let result: CalculateItem = 1
        sut.enQueue(item: 1)
        sut.enQueue(item: 2)
        XCTAssertEqual(sut.first as? Double, result as? Double)
    }
    
    func test_last_프로퍼티가_큐배열의_마지막_인덱스를_가르키는지() {
        let result: CalculateItem = 2
        sut.enQueue(item: 1)
        sut.enQueue(item: 2)
        XCTAssertEqual(sut.last as? Double, result as? Double)
    }
    
    func test_isEmpty_프로퍼티에_값을_넣었을때_False_값을_반환하는지() {
        let calculateItem = 0.35
        sut.enQueue(item: calculateItem)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_isEmpty_프로퍼티에_값을_넣었을때_True_값을_반환하는지() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_enQueue큐_배열에_값이_추가가_되는지() {
        let result: [Double] = [1, 2]
        sut.enQueue(item: 1)
        sut.enQueue(item: 2)
        XCTAssertEqual(sut.list as? [Double], result)
    }
    
    func test_resetQueue큐_배열의_값이_제거가되는지() {
        sut.enQueue(item: 1)
        sut.resetQueue()
        XCTAssertTrue(sut.isEmpty)
    }

    func test_deQueue큐배열의_처음_인덱스를_제거해주는지(){
        let test: Double = 1
        sut.enQueue(item: 1)
        sut.enQueue(item: 2)
        
        let result = sut.deQueue()
        
        XCTAssertEqual(result as? Double, test)
    }
}
