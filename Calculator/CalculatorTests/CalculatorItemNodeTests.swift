//
//  CalculatorItemNodeTests.swift
//  CalculatorItemNodeTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemNodeTests: XCTestCase {
    var sut: CalculatorItemNode<Double>!

    override func setUpWithError() throws {
        let value: Double = 7.0
        sut = CalculatorItemNode(value)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_changeNext_Node의_next_값이_바뀐다() {
        // given
        let value: Double = 5.0
        let newNode = CalculatorItemNode(value)
        
        // when
        sut.changeNext(newNode)
        
        // then
        XCTAssertIdentical(newNode, sut.next)
    }
}
