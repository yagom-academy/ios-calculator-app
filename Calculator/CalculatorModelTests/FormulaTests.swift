//  Created by Aejong on 2022/09/27

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands: CalculatorItemQueueByLinkedList<Double>!
    var operators: CalculatorItemQueueByLinkedList<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueueByLinkedList()
        operators = CalculatorItemQueueByLinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_formula인스턴스생성해준상태로_1_add_2의결과가_3이반환되야한다() {
        // given
        operands.enqueue(1)
        operands.enqueue(2)
        
        operators.enqueue(.add)
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        var result:Double = 0
        do {
            result = try sut.result()
        } catch CalculateError.divideByZero {
            print("0으로 나눌 수 없습니다")
        } catch {
            
        }
        
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_1_2_3의피연산자와2개의add연산자를enqueue하고_result에서6이반환되어야한다() {
        // given
        operands.enqueue(1)
        operands.enqueue(2)
        operands.enqueue(3)
        
        operators.enqueue(.add)
        operators.enqueue(.add)
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        var result:Double = 0
        do {
            result = try sut.result()
        } catch CalculateError.divideByZero {
            print("0으로 나눌 수 없습니다")
        } catch {
            
        }
        
        // then
        XCTAssertEqual(result, 6.0)
    }
    
    func test_5개의피연산자와4개의각각다른연산자를통해_구현되어야한다() {
        // given
        operands.enqueue(1)
        operands.enqueue(2)
        operands.enqueue(3)
        operands.enqueue(4)
        operands.enqueue(5)
        
        operators.enqueue(.add)
        operators.enqueue(.multiply)
        operators.enqueue(.divide)
        operators.enqueue(.subtract)
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        var result:Double = 0
        do {
            result = try sut.result()
        } catch CalculateError.divideByZero {
            print("0으로 나눌 수 없습니다")
        } catch {
            
        }
        
        // then
        XCTAssertEqual(result, -2.75)
    }
    
    func test_0으로나누었을때_오류를발생시켜야한다() {
        // given
        operands.enqueue(1)
        operands.enqueue(0)
        
        operators.enqueue(.divide)
        
        sut = Formula(operands: operands, operators: operators)
        
        // when, then
        XCTAssertThrowsError(try sut.result()) {error in
            print(error,"가 발생했습니다")
        }
    }
}
