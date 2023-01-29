//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Andrew on 2023/01/25.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue함수호출로_값을넣으면_enqueueStack에값이삽입되는함수() {
        // given
        let input: Array<Int> = [11]
        
        // when
        sut.enqueue(element: 11)
        
        // then
        XCTAssertEqual(input, sut.enqueueStack)
    }
    

    
    func test_queue에요소가들어있는상태에서_isEmpty를호출할경우_false를확인하는함수() {
        // given
        
        // when
        sut.enqueue(element: 11)
        
        // then
        XCTAssertFalse(sut.isEmpty())
    }
    


}
