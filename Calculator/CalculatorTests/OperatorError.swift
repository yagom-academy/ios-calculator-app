//
//  OperatorError.swift
//  CalculatorTests
//
//  Created by 박병호 on 2021/11/11.
//

import XCTest

class OperatorError: XCTestCase {
    
    func test_0으로_나누면_NotANumber_오류가_발생한다() {
        
        XCTAssertThrowsError(try Operator.divide.calculate(lhs: 1, rhs: 0)){ error in XCTAssertEqual(error as? CalculateError, CalculateError.notNumber)}
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
