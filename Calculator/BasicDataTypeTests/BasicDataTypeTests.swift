//
//  BasicDataTypeTests.swift
//  BasicDataTypeTests
//
//  Created by Ayaan on 2022/09/22.
//

import XCTest

class BasicDataTypeTests: XCTestCase {
    func test_Double_Type_실수_2를_is로_CalculateItem과_type_checking한_결과는_참인가() {
        let input: Double = 2.0
        
        let result: Bool = input is CalculateItem
        
        XCTAssertTrue(result)
    }
}
