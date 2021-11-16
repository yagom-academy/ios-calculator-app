//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/14.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    
    var sutResult: Double!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutResult = 0.0
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutResult = nil
    }

    func test_2_더하기_3_빼기_4_더하기_5의_parse_result로_6을_반환하는가() {
        // given
        let form = "2+3−4+5"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, 6.0)
    }
    
    func test_2_더하기_3_곱하기_3_빼기_1의_result로_14를_반환하는가() {
        // given
        let form = "2+3×3−1"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, 14.0)
        
    }
    
    func test_3_나누기_3_더하기_2_빼기_1의_result로_2를_반환하는가() {
        // given
        let form = "3÷3+2−1"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, 2.0)
        
    }
    
    func test_1_더하기_2_빼기_3_곱하기_2_빼기_3_나누기_6_의_result로_음수0점5를_반환하는가() {
        // given
        let form = "1+2−3×2−3÷6"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, -0.5)
        
    }
    
    func test_1_더하기_2_빼기_3_곱하기_2_빼기_음수3_나누기_6_의_result로_1점5를_반환하는가() {
        // given
        let form = "1+2−-3×2−3÷6"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, 9.0/6.0)
        
    }
    
    func test_1_더하기_음수2_빼기_3_곱하기_2_빼기_3_나누기_6_의_result로_음수11점0_나누기_6점0를_반환하는가() {
        // given
        let form = "1+-2−3×2−3÷6"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, -11.0/6.0)
        
    }
    
    func test_1_더하기_2_빼기_3_곱하기_음수2_빼기_3_나누기_6_의_result로_음수0점5를_반환하는가() {
        // given
        let form = "1+2−3×-2−3÷6"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, -3.0/6.0)
        
    }
    
    func test_1_더하기_2_빼기_3_곱하기_2_빼기_3_나누기_음수6_의_result로_0점5를_반환하는가() {
        // given
        let form = "1+2−3×2−3÷-6"
        
        // when
        do {
            sutResult = try ExpressionParser.parse(from: form).result()
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutResult, 3.0/6.0)
        
    }
    
    func test_잘못된_연산자를_포함하여_1_더하기_2_빼기_3_곱하기_2_빼기_3_나누기_음수6_의_result로_오류를_반환하는가() {
        // given
        let form = "1+2−3*2−3/-6"
        
        // when
        // then
        XCTAssertThrowsError(try ExpressionParser.parse(from: form))
        
    }
}
