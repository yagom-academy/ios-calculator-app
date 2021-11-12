//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/13.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_add호출시_lhs와_rhs의_합을_반환한다(){
        let lhs = 11.00
        let rhs = 9.99
        let sum = Operator.add.add(lhs: lhs , rhs: rhs)
        
        XCTAssertEqual(sum, lhs + rhs)
    }

}
