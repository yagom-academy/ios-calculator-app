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
        do {
            result = try Operator.calculate(.add)(lhs: 1111.11111, rhs: 2222.22222)
        } catch {
            throw Calculator.otherError
        }
        
        //result는 3333.33333이고 그 외의값은 XCTAssertNotEqual이다.
        XCTAssertEqual(1111.11111 + 2222.22222, result)
        XCTAssertEqual(3333.33333, result)
        XCTAssertNotEqual(4444.44444, result)
    }
    
    func test_calculate_subtract_빼기값확인() throws {
        //expection 4444.44444 - 3333.33333
        do {
            result = try Operator.calculate(.subtract)(lhs: 4444.44444, rhs: 3333.33333)
        } catch {
            throw Calculator.otherError
        }
        
        //result는 1111.11111이고 그 외의값은 XCTAssertNotEqual이다.
        XCTAssertEqual(4444.44444 - 3333.33333, result)
        XCTAssertEqual(1111.11111, result)
        XCTAssertNotEqual(2222.22222, result)
    }
    
    func test_calculate_divide_0이아닌수로나누기값확인() throws {
        //expection 4444.44444 / 2.2
        do {
            result = try Operator.calculate(.divide)(lhs: 4444.44444, rhs: 2.2)
        } catch {
            throw Calculator.otherError
        }
        
        //result는 2020.20202이고 그 외의값은 XCTAssertNotEqual이다.
        XCTAssertEqual(4444.44444 / 2.2, result)
        XCTAssertEqual(2020.20202, result)
        XCTAssertNotEqual(2222.22222, result)
    }
    
    func test_calculate_divide_0으로나누기할때_에러던지기확인() throws {
        //expection 4444.44444 / 0
        do {
            let result = try Operator.calculate(.divide)(lhs: 4444.44444, rhs: 0)
        } catch {
            throw Calculator.otherError
        }
        
        //result 에러를 던진다.
        XCTAssertThrowsError(result)
    }
    
    func test_calculate_multiply() throws {
        //expection 3333.33333 * 2.2
        do {
            let result = try Operator.calculate(.multiply)(lhs: 3333.33333, rhs: 2.2)
        } catch {
            throw Calculator.otherError
        }
        
        //result는 73333.33333이고 그 외의값은 XCTAssertNotEqual이다.
        XCTAssertEqual(3333.33333 * 2.2, result)
        XCTAssertEqual(7333.33333, result)
        XCTAssertNotEqual(2222.22222, result)
    }
}
