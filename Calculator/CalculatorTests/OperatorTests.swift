//
//  OperatorTests.swift
//  Created by Wonbi
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    func test_add에랜덤한두값을입력했을때_결과가두값의합으로나오는지() {
        let lhs = Double.random(in: -100.0...100.0)
        let rhs = Double.random(in: -100.0...100.0)
        
        let result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(lhs + rhs, result)
    }
}
