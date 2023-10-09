//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by uemu on 2023/10/09.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue로_1과2를_넣고_dequeue를_2번호출한_상태에서_isEmpty가_true를_반환하는지() {
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.dequeue()
        sut.dequeue()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue로_3과4를_넣고_count를_호출하여_2개의인자가있는지() {
        sut.enqueue(value: 3)
        sut.enqueue(value: 4)
        
        let result = sut.count
        
        XCTAssertEqual(result, 2)
        
    }
    
    func test_enqueue로_5와6을_넣고_peek을_호출하여_첫번째_인자가_5가맞는지() {
        sut.enqueue(value: 5)
        sut.enqueue(value: 6)
        
        let result = sut.peek
        
        XCTAssertEqual(result, 5)
    }
    
    func test_enqueue로_1과2를_넣고_clear를_호출하여_isEmpty로_초기화가됐는지_확인() {
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.clear()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
}
