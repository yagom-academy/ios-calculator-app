//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by hyunMac on 10/4/23.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue실행시_3_2_1를_전달했을때_elements에_잘들어가는지() {
        sut.enqueue(input: 3)
        sut.enqueue(input: 2)
        sut.enqueue(input: 1)
        
        XCTAssertEqual(sut.elements, [3,2,1])
    }
    
    func test_elements가_비어있을시_dequeue실행이_가능한지() {
        sut.dequeue()
        
        XCTAssertEqual(sut.elements, [])
    }
    
    func test_enqueue로_3_2_1넣고_dequeue_한_번_실행시_elements가_앞에서_하나줄어드는지() {
        sut.enqueue(input: 3)
        sut.enqueue(input: 2)
        sut.enqueue(input: 1)
        sut.dequeue()
        
        XCTAssertEqual(sut.elements, [2,1])
    }
    
    func test_enqueue로_3_2_1넣고_clear_실행시_elements가_빈배열이되는지() {
        sut.enqueue(input: 3)
        sut.enqueue(input: 2)
        sut.enqueue(input: 1)
        sut.clear()
        
        XCTAssertEqual(sut.elements, [])
    }
    
    func test_isEmpty실행시_elements가_비어있을경우_True로_반환하는지() {
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_enqueue로_3_2_1넣고_isEmpty실행시_elements가_False로_반환하는지() {
        sut.enqueue(input: 3)
        sut.enqueue(input: 2)
        sut.enqueue(input: 1)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_enqueue로_3_2_1넣고_peek_실행시_3이_출력되는지() {
        sut.enqueue(input: 3)
        sut.enqueue(input: 2)
        sut.enqueue(input: 1)
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 3)
    }
}
