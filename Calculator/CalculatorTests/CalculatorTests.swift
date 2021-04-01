//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김찬우 on 2021/03/29.
//

import XCTest
@testable import Calculator
class CalculatorTests: XCTestCase {
    
    var testDecimalCalculator = DecimalCalculator()
    
    override func setUpWithError() throws {
        testDecimalCalculator = DecimalCalculator()
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        test_devide_한자리정수_두개()
    }
    
    func test_devide_한자리정수_두개() {
        XCTAssertEqual(testDecimalCalculator.divide(1, by: 2), 0.5)
    }
    
}
