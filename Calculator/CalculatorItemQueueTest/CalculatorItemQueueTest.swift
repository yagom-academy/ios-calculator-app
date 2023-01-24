//  CalculatorItemQueueTest.swift
//  Created by 레옹아범 on 2023/01/24.

import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_숫자입력이_멈췄을_때_items에_해당_값이_추가된다() {
        let numbers = "123"
        sut!.item = numbers
        
        sut?.finishInputNumbers()
        
        let value = sut!.items.head!.value
        let equalNumbersAndValue = numbers == value
        
        XCTAssertTrue(equalNumbersAndValue)
    }
    
    func test_숫자가_아무것도_입력되지_않은_상태일_경우_items에_추가되지_않는다() {
        sut?.item = ""
        sut?.finishInputNumbers()
        
        let head = sut!.items.head
        
        XCTAssertNil(head)
    }
    
    func test_숫자값이_입력될_경우_numbers프로퍼티에_하나씩_추가된다() {
        let exception = "1"
        
        sut.pushNumber("1")
        
        XCTAssertEqual(sut.item, exception)
    }
    
}
