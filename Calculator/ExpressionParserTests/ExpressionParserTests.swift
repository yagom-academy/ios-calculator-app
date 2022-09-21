//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by leewonseok on 2022/09/21.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        
    }
    func test_정상적으로parse되는지(){
        var a = ExpressionParser.parse(from: "123+233")
        print("---------------")
        print(a.operands)
        print(a.operators)
        print("---------------")
    }
}
