//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Toy on 10/5/23.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Enqueue호출시_요소가_제대로_추가되는지() throws {
        let _ = sut.enqueue(3)
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 3)
    }

    func test_Denqueue호출시_가장앞의_요소가_삭제되는지() {
        let _ = sut.enqueue(1)
        let _ = sut.enqueue(2)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 1)
    }
}
