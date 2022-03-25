import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    func test_result_식이_주어졌을때_연산결과가_올바른가() {
        //given
        let formula = "1 + 3 - 3 / 1 * 1"
        let expectedValue = 1.0
        
        //when
        do {
            var formulaInstance = try ExpressionParser.parse(from: formula)
            let result = formulaInstance.result()
            
            //then
            XCTAssertEqual(result, expectedValue)
        } catch {
            print(error)
        }
    }
    
    func test_result_연산중간에_0으로_나누는경우_연산결과가_nan인가() {
        //given
        let formula = "1 + 3 - 3 / 0 * 1"
        
        //when
        do {
            var formulaInstance = try ExpressionParser.parse(from: formula)
            let result = formulaInstance.result()
            
            //then
            XCTAssertTrue(result.isNaN)
        } catch {
            print(error)
        }
    }
    
    func test_result_피연산자의_숫자가_큰경우_연산결과가_올바른가() {
        //given
        let formula = "10000000 + 3333333 - 33333333 / 444444 * 1111111"
        let expectedValue = -50000045.000045
        
        //when
        do {
            var formulaInstance = try ExpressionParser.parse(from: formula)
            let result = formulaInstance.result()
            
            //then
            XCTAssertEqual(result, expectedValue)
        } catch {
            print(error)
        }
    }
    
    func test_result_피연산자에_음수가_있을때_연산결과가_올바른가() {
        //given
        let formula = "1 + -3 - 3 / 1 * 3"
        let expectedValue = -15.0
        
        //when
        do {
            var formulaInstance = try ExpressionParser.parse(from: formula)
            let result = formulaInstance.result()
            
            //then
            XCTAssertEqual(result, expectedValue)
        } catch {
            print(error)
        }
    }
}
