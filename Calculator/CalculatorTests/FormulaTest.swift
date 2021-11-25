//
//  FormulaTest.swift
//  CalculatorTests
//
//  Created by Seul Mac on 2021/11/15.
//
import XCTest

class FormulaTest: XCTestCase {

    func test_정수_수식_연산결과_확인() {
        let input = "11+12−13×14÷15+16−17×18÷19"
        var formula = ExpressionParser.parse(from: input)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, 7.8947368421052619)
        } catch CalculatorError.emptyQueue {
            print("연산을 할 수 없습니다.")
        } catch {
            print(error)
        }
    }
    
    func test_정수_실수_음수_포함_수식_연산결과_확인() {
        let input = "11+1.2−13×14.990÷15+16−-17×1.8÷19.999"
        var formula = ExpressionParser.parse(from: input)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, 2.8981929096454819)
        } catch CalculatorError.emptyQueue {
            print("연산을 할 수 없습니다.")
        } catch {
            print(error)
        }
    }
    
}
