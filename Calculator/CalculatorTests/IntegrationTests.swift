//
//  IntegrationTests.swift
//  CalculatorTests
//
//  Created by Minsup on 2023/06/02.
//

import XCTest
@testable import Calculator

final class IntegrationTests: XCTestCase {

    func test_정상적인_수식을_parse해서_result를_호출하면_값을_계산해서_반환한다() throws {
        // given
        let input1 = "5+3×10÷2"
        let input2 = "50+32×100÷10"
        let input3 = "50.1+32.5×10.13÷2.5"
        let input4 = "5.153+3.55×10÷2"
        let input5 = "5-3×10.00÷2.5123"
        
        let expectation1 = 40.0
        let expectation2 = 820.0
        let expectation3 = 334.6952
        let expectation4 = 43.515
        let expectation5 = 7.960832703100744
        
        // when
        var formula1 = ExpressionParser.parse(from: input1)
        var formula2 = ExpressionParser.parse(from: input2)
        var formula3 = ExpressionParser.parse(from: input3)
        var formula4 = ExpressionParser.parse(from: input4)
        var formula5 = ExpressionParser.parse(from: input5)
        
        let result1 = try formula1.result()
        let result2 = try formula2.result()
        let result3 = try formula3.result()
        let result4 = try formula4.result()
        let result5 = try formula5.result()
        
        // then
        XCTAssertEqual(result1, expectation1)
        XCTAssertEqual(result2, expectation2)
        XCTAssertEqual(result3, expectation3)
        XCTAssertEqual(result4, expectation4)
        XCTAssertEqual(result5, expectation5)
    }
    
    func test_0으로_나누는_수식을_parse해서_result를_호출하면_divisionByZero_에러가_발생한다() throws {
        // given
        let input1 = "5÷0"
        let input2 = "50+32×100÷0"
        let input3 = "50.1+32.5×10.13÷0"
        let input4 = "5.153÷0+3.55×-10"
        let input5 = "5×10.00÷0"
        
        // when
        let formula1 = ExpressionParser.parse(from: input1)
        let formula2 = ExpressionParser.parse(from: input2)
        let formula3 = ExpressionParser.parse(from: input3)
        let formula4 = ExpressionParser.parse(from: input4)
        let formula5 = ExpressionParser.parse(from: input5)
        // then
        try [formula1, formula2, formula3, formula4, formula5].forEach { formula in
            var formula = formula
            XCTAssertThrowsError(try formula.result()) { error in
                if let error = error as? CalculationError {
                    XCTAssertEqual(error, .divisionByZero)
                } else {
                    XCTFail("예상하지 않은 에러 출력 \(error)")
                }
            }
        }
    }
    
    func test_피연산자의_개수가_부족하면_존재하는_피연산자까지만_계산해서_리턴한다() throws {
        let input1 = "1+"
        let input2 = "5+3-"
        let input3 = "1++"
        
        var formula1 = ExpressionParser.parse(from: input1)
        var formula2 = ExpressionParser.parse(from: input2)
        var formula3 = ExpressionParser.parse(from: input3)
        
        // then
        XCTAssertEqual(try formula1.result(), 1.0)
        XCTAssertEqual(try formula2.result(), 8.0)
        XCTAssertEqual(try formula3.result(), 1.0)
        
    }
    
    func test_10개의_피연산자_계산_속도_측정() {
        // given
        let input = "10+10+10+10+10+10+10+10+10+10"
        
        measure {
            do {
                var formula = ExpressionParser.parse(from: input)
                _ = try formula.result()
            } catch {
                
            }
        }
    }
    
    func test_2자리수_100개의_피연산자_계산_속도_측정() {
        // given
        var input: String = ""
        for time in 0...99 {
            input += time != 99 ? "10+" : "10"
        }

        measure {
            do {
                var formula = ExpressionParser.parse(from: input)
                _ = try formula.result()
            } catch {
                if let error = error as? CalculationError {
                    print(error)
                } else {
                    print("알 수 없는 에러: \(error)")
                }
            }
        }
    }
    
    func test_10자리_수_100개의_피연산자_계산_속도_측정() {
        // given
        var input: String = ""
        for time in 0...99 {
            input += time != 99 ? "1000000000+" : "1000000000"
        }

        measure {
            do {
                var formula = ExpressionParser.parse(from: input)
                _ = try formula.result()
            } catch {
                if let error = error as? CalculationError {
                    print(error)
                } else {
                    print("알 수 없는 에러: \(error)")
                }
            }
        }
    }
    
    func test_랜덤한_피연산자_1000개_계산_속도_측정() {
        var input: String = ""
        for time in 0...999 {
            let random: Double = Double.random(in: -1000...1000)
            let randomString = time != 999 ? String(random) + "+" : String(random)
            input += randomString
        }
        print(input)
        
        measure {
            do {
                var formula = ExpressionParser.parse(from: input)
                _ = try formula.result()
            } catch {
                if let error = error as? CalculationError {
                    print(error)
                } else {
                    print("알 수 없는 에러: \(error)")
                }
            }
        }
    }
    
    func test_1자리수_100000개의_피연산자_계산_속도_측정() {
        // given
        var input: String = ""
        for _ in 0...99999 {
            input += "1+"
        }
        _ = input.removeLast()
        
        measure {
            do {
                var formula = ExpressionParser.parse(from: input)
                let answer = try formula.result()
                print("answer: \(answer)")
            } catch {
                if let error = error as? CalculationError {
                    print(error)
                } else {
                    print("알 수 없는 에러: \(error)")
                }
            }
        }
    }    
}
