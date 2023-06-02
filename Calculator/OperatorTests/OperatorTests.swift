//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Erick on 2023/06/01.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: [Operator]!
    
    override func setUpWithError() throws {
        sut = Operator.allCases
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_모든_연산자가_정상적으로_값을_반환합니다() {
        sut.forEach { oper in
            let expectation: Double
            let result = oper.calculate(lhs: 2, rhs: 1)
            
            switch oper {
            case .add:
                expectation = 3
                XCTAssertEqual(result, expectation)
            case .subtract:
                expectation = 1
                XCTAssertEqual(result, expectation)
            case .divide:
                expectation = 2
                XCTAssertEqual(result, expectation)
            case .multiply:
                expectation = 2
                XCTAssertEqual(result, expectation)
            }
        }
    }
    
    func test_0으로_divide하면_nan을_반환합니다() {
        sut.filter { oper in
            oper == .divide
        }.forEach { oper in
            let result = oper.calculate(lhs: 2, rhs: 0)
            
            XCTAssertTrue(result.isNaN)
        }
    }
}
