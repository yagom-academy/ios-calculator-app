//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Christy Lee on 2023/01/26.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<String>()
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_데이터가_비어있을때_isEmpty호출시_True를반환한다() {
        //given
        sut.data = []
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_데이터가_들어있을때_isEmpty호출시_False를반환한다() {
        //given
        sut.data = ["1", "2", "3"]
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertFalse(result)
    }
}
