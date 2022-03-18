//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by DuDu on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula?
    
    override func setUpWithError() throws {
    
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_operands큐에_3_2_1_5가있고_operators큐에_add_substract_multiply가있을때_result결과가_20이여야한다() {
        //given
        let operands: [Double] = [3,2,1,5]
        let operators: [Operator] = [.add, .subtract, .multiply]
        
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        operands.forEach{ operandQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0)}
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
    
        //when
        let result = try? sut?.result()
        
        //then
        XCTAssertEqual(result, 20)
    }
    
    func test_operands큐에_1_2_3_4가있고_operators큐에_add가있을때_CalculateError_invalidFormula가_발생해야한다() {
        //given
        let operands: [Double] = [1,2,3,4]
        let operators: [Operator] = [.add]
        
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        operands.forEach{ operandQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0)}
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        //when
        do {
            let result = try sut?.result()
            XCTAssertTrue(false)
        } catch (let error as CalculateError) {
            XCTAssertEqual(error, CalculateError.invalidFormula)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func test_operands큐에_1_1_0이있고_operators큐에_substract_divide가있을때_CalculateError_divideByZero가_발생해야한다() {
        //given
        let operands: [Double] = [1,1,0]
        let operators: [Operator] = [.subtract, .divide]
        
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        operands.forEach{ operandQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0)}
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        //when
        do {
            let result = try sut?.result()
            XCTAssertTrue(false)
        } catch (let error as CalculateError) {
            XCTAssertEqual(error, CalculateError.divideByZero)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
