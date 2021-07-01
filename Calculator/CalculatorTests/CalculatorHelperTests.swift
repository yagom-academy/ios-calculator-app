//
//  CalculatorHelperTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/07/01.
//

import XCTest
import Foundation
@testable import Calculator

class CalculatorHelperTests: XCTestCase {
    
    func test_10000을_준비하여_applyCommaOnThreeDigits메서드를_호출했을때_10콤마000이_나오는가() {
        //givin
        let expectInputValue = "10000"
        
        //when
        let result = CalculatorHelper.applyCommaOnThreeDigits(notation: expectInputValue)
        let expectedResult = "10,000"
        
        //then
        XCTAssertEqual(expectedResult, result)
    }
}
