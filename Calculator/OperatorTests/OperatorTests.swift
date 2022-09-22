//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 써니쿠키 on 2022/09/22.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var result: Double!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        result = 0.0
    }
    
    override func tearDownWithError() throws {
        try super.setUpWithError()
        result = nil
    }
    
    func test_calculate_add_더하기값확인() throws {
        //expection 1111.11111 + 2222.22222
        result = try Operator.calculate(.add)(lhs: 1111.11111, rhs: 2222.22222)
        
        //result는 1111.11111 + 2222.22222(=3333.33333)이고 그 외의값은 NotEqual이다.
        XCTAssertEqual(1111.11111 + 2222.22222, result)
        XCTAssertNotEqual(4444.44444, result)
    }
    
    func test_calculate_subtract_빼기값확인() throws {
        //expection 4444.44444 - 3333.33333
        result = try Operator.calculate(.subtract)(lhs: 4444.44444, rhs: 3333.33333)
        
        //result는 4444.44444 - 3333.33333(=1111.11111)이고 그 외의값은 NotEqual이다.
        XCTAssertEqual(4444.44444 - 3333.33333, result)
        XCTAssertNotEqual(2222.22222, result)
    }
    
    func test_calculate_divide_0이아닌수로나누기값확인() throws {
        //expection 4444.44444 / 2.2
        result = try Operator.calculate(.divide)(lhs: 4444.44444, rhs: 2.2)
        
        //result는 4444.44444 / 2.2 (=2020.20202)이고 그 외의값은 NotEqual이다.
        XCTAssertEqual(4444.44444 / 2.2, result)
        XCTAssertNotEqual(2222.22222, result)
    }
    
    func test_calculate_divide_0으로나누기할때_에러던지기확인() throws {
        //expection 4444.44444 / 0 하면 에러를 던진다
        //result 에러를 던진다.
        XCTAssertThrowsError(try Operator.calculate(.divide)(lhs: 4444.44444, rhs: 0))
    }
    
    func test_calculate_multiply() throws {
        //expection 3333.33333 * 2.2
        let result = try Operator.calculate(.multiply)(lhs: 3333.33333, rhs: 2.2)

        //result는 3333.33333 * 2.2 (=73333.33333)이고 그 외의값은 NotEqual이다.
        XCTAssertEqual(3333.33333 * 2.2, result)
        XCTAssertNotEqual(2222.22222, result)
    }
}
