//
//  OperatorItemTests.swift
//  OperatorItemTests
//
//  Created by myungsun on 2023/05/30.
//

import XCTest
@testable import Calculator

final class OperatorItemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_OperatorItem_decription_프로퍼티가_각_case_별로_정상적으로_반환된다() {
        XCTAssertEqual(OperatorItem.add.description, "+")
        XCTAssertEqual(OperatorItem.subtract.description, "-")
        XCTAssertEqual(OperatorItem.multiply.description, "×")
        XCTAssertEqual(OperatorItem.divide.description, "÷")
    }
}
