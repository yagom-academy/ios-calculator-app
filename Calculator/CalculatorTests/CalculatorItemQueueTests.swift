//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    var doubleSut: CalculatorItemQueue<Double>?
    var operatorSut: CalculatorItemQueue<Operator>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        doubleSut = CalculatorItemQueue<Double>()
        operatorSut = CalculatorItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
       doubleSut = nil
        operatorSut = nil
    }
    
    func test_빈_배열에서_Double타입_1을_append하면_Double타입_1이_남는다() {
        doubleSut?.appendItem(1.0)
        XCTAssertEqual(doubleSut?.items, [1.0])
    }
    
    func test_빈_배열에서_Character타입_더하기를_append하면_연산자배열에_더하기가_생성되는지() {
        operatorSut?.appendItem(.add)
        XCTAssertEqual(operatorSut?.items, [.add])
    }
    
    func test_배열에_값이_하나_들어있을_경우_removeItem을_하면_빈_배열로_되는지() {
        operatorSut?.appendItem(.add)
        
        XCTAssertEqual(try operatorSut?.removeItem(), [])
    }
    
    func test_빈_Double배열에_removeItem을_하면_오류를_뱉는지() {
        XCTAssertThrowsError(try doubleSut?.removeItem())
    }
    
    func test_빈_Operator배열에_removeItem을_하면_오류를_뱉는지() {
        XCTAssertThrowsError(try doubleSut?.removeItem())
    }
    
    func test_배열에_Character_값이_3개_들어있을_때_removeAllItem을_하면_빈_배열로_되는지() {
        operatorSut?.appendItem(.add)
        operatorSut?.appendItem(.divide)
        operatorSut?.appendItem(.multiply)
        
        do {
            try operatorSut?.removeAllItems()
        } catch {
            return
        }
        
        XCTAssertEqual(operatorSut?.items, [])
    }
    
    func test_배열에_Double_값이_3개_들어있을_때_removeAllItem을_하면_빈_배열로_되는지() {
        doubleSut?.appendItem(1)
        doubleSut?.appendItem(2)
        doubleSut?.appendItem(3)
        
        do {
            try doubleSut?.removeAllItems()
        } catch {
            return
        }
        
        XCTAssertEqual(doubleSut?.items, [])
    }
}
