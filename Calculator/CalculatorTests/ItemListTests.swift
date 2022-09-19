//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/19.
//

import XCTest
@testable import Calculator

final class ItemListTests: XCTestCase {
    var sut: ItemList!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ItemList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_값을_넣었을_때_head가_nil이_아님() {
        sut.enqueue("test")
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_clearQueue_실행_시_head_tail_가_nil() {
        test_enqueue_값을_넣었을_때_head가_nil이_아님()
        sut.clearQueue()
        
        XCTAssertTrue(sut.isEmpty())
    }

}
