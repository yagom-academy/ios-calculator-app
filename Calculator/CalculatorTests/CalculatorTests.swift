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
}
