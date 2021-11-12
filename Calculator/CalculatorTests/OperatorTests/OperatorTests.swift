//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 임지성 on 2021/11/11.
//

import XCTest

class OperatorTests: XCTestCase {
    var sut: Operator!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_calculate호출시_값을정상적으로반환하는지() {
        let result = sut.calculate(lhs: 0, rhs: 0)
        
        XCTAssertNotNil(result)
    }

}
