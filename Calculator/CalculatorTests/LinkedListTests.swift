//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by Whales on 2023/06/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Double>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_append함수호출시_list의node개수가_늘어나는지() {
        // given
        let expectation: Int = 3
        // when
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
}
