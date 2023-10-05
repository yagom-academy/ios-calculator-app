//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hisop on 2023/10/05.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculateItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculateItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue() {
        sut.enqueue(value: 1, operatorType: .plus)
        sut.enqueue(value: 2, operatorType: .minus)
        
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.head?.operatorType, .plus)

        XCTAssertEqual(sut.tail?.value, 2)
        XCTAssertEqual(sut.tail?.operatorType, .minus)
    }

}
