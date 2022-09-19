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
    
    func test_enqueue() {
        
    }
    
    func test_isEmpty() {
        
    }

}
