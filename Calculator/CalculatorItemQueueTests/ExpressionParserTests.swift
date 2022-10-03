//
//  ExpressionParserTests.swift
//  Created by 미니.
//
import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_연산자와피연산자의문자가모드정상적인경우결과가예측치와동일한지() {
        // driven
        let input: String = "10+9×8"
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        
        do {
            let result = try form.result()

            // then
            XCTAssertEqual(result, 152)
        } catch {

        }
        
        XCTAssertTrue(true)

    }
    
    func test_다른연산자와마이너스연산자가붙어서나올때결과가예측치와동일한가() {
        // driven
        let input: String = "10+9÷7"
        
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        
        do {
            let result = try form.result()
            
            // then
            XCTAssertEqual(result, 2.7142857142857144)
        } catch {
            
        }
    }
    
    func test_첫번째피연산자에마이너스가붙은경우결과가예측치와동일한가() {
        // driven
        let input: String = "-10+9×876"
        // when
        let form: Formula = ExpressionParser.parse(from: input)
        
        do {
            let result = try form.result()
            
            // then
            XCTAssertEqual(result, -876)
        } catch {
            
        }
    }
}

