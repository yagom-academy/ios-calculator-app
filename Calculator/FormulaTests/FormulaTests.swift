//  FormulaTests.swift
//  FormulaTests
//  Created by LJ on 2022/09/23.

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_숫자3개_혼합연산하는_경우() {
        //given
        sut.operands.enqueue(element: 5.0)
        sut.operands.enqueue(element: -10.0)
        sut.operands.enqueue(element: 3.0)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .multiply)
        
        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }
        
        //then
        XCTAssertEqual(result, -15)
    }
    
    func test_숫자4개_혼합연산하는_경우() {
        //given
        sut.operands.enqueue(element: 5.0)
        sut.operands.enqueue(element: -10.0)
        sut.operands.enqueue(element: 3.0)
        sut.operands.enqueue(element: -7.0)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .multiply)
        
        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }
        
        //then
        XCTAssertEqual(result, 14)
    }
    
    func test_연산자가_하나남는경우() {
        //given
        sut.operands.enqueue(element: 5.0)
        sut.operands.enqueue(element: -10.0)
        sut.operands.enqueue(element: 3.0)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .multiply)

        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }
        
        //then
        XCTAssertEqual(result, -2)
    }
    
    func test_빼기연산_성공하는지() {
        //given
        sut.operands.enqueue(element: 5.0)
        sut.operands.enqueue(element: -10.0)
        sut.operators.enqueue(element: .subtract)
        
        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }

        //then
        XCTAssertEqual(result, 15.0)
    }
    
    func test_곱하기연산_성공하는지() {
        //given
        sut.operands.enqueue(element: 5.0)
        sut.operands.enqueue(element: -10.0)
        sut.operators.enqueue(element: .multiply)
        
        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }

        //then
        XCTAssertEqual(result, -50)
    }
    
     func test_나누기연산_성공하는지() {
         //given
         sut.operands.enqueue(element: 15.0)
         sut.operands.enqueue(element: 5.0)
         sut.operators.enqueue(element: .divide)
         
         //when
         var result: Double?
         do {
             result = try sut.result()
         } catch OccuredError.emptyOperator {
             print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
         } catch { }

         //then
         XCTAssertEqual(result, 3)
     }

    func test_0으로나누기연산_성공하는지() {
        //given
        sut.operands.enqueue(element: 50.0)
        sut.operands.enqueue(element: 0)
        sut.operators.enqueue(element: .divide)
        
        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }
        if result == Double.infinity {
            print("\(Double.nan)")
        }
        
        //then
        XCTAssertEqual(result,Double.infinity)
    }

    func test_연산자입력_안되었을_경우_오류처리_하는지() {
        //given
        sut.operands.enqueue(element: 5.0)
        sut.operands.enqueue(element: -10.0)
        
        //when
        var result: Double?
        do {
            result = try sut.result()
        } catch OccuredError.emptyOperator {
            print("잘못된 입력입니다. 연산자를 포함하여 입력해주세요.")
        } catch { }
        
        //then
        XCTAssertEqual(result, nil)
    }
}
