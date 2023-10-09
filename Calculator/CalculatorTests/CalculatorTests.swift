//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by hyunMac on 10/9/23.
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
    
    func test_enqueue실행시_3_2_1를_넣어주고_dequeue실행시_원하는요소가_나오는지() {
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        
        XCTAssertEqual(sut.dequeue(), 3)
        XCTAssertEqual(sut.dequeue(), 2)
        XCTAssertEqual(sut.dequeue(), 1)
    }
    
    func test_노드가_없을때_dequeue실행시_nil을_반환하는지() {
        XCTAssertEqual(sut.dequeue(), nil)
    }
    
    func test_enqueue로_3_2_1을_넣어주고_peek실행시_3이_출력되는지(){
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        
        let result = sut.peek()
        XCTAssertEqual(result, 3)
    }
    
    func test_노드가_존재하지_않을때_isEmpty실행시_true를_반환하는지() {
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_enqueue로_3을_넣어주고_isEmpty실행시_false를_반환하는지() {
        sut.enqueue(3)
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_enqueue로_3을_넣어주고_dequeue로_제거후_isEmpty실행시_true를_반환하는지(){
        sut.enqueue(3)
        let dequeueElement = sut.dequeue()
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_enqueue실행시_3_2_1를_넣어주고_clear실행후_isEmpty실행시_true를_반환하는지(){
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        sut.clear()
        XCTAssertTrue(sut.isEmpty())
    }
    
}
