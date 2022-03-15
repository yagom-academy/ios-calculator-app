//  CalculatorTests.swift
//  CalculatorTests
//  Created by LIMGAUI on 2022/03/15

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: Node!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Node(data: nil)
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_nodeInitializer_isSuccess() {
        let nodes = Node(data: nil, next: nil)
        
        let result = Node(data: sut.data, next: nil)
        
        XCTAssertEqual(result.data, nodes.data)
    }
}
