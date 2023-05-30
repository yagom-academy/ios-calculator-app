//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by minsong kim on 2023/05/29.
//

import XCTest
@testable import Calculator

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
    
    func test_firstStack에_순서대로요소가추가되는지() {
        //given
        let input = 10
        let nextInput = 20
        
        //when
        var result = sut.pushStack(input)
        result = sut.pushStack(nextInput)
        
        //then
        XCTAssertEqual(result, [10, 20])
    }
    
    func test_firstStack에서_pop한요소가_backwardStack에_push되는지() {
        //given
        sut.firstStack = [1, 2, 3]
        
        //when
        let result = sut.popAndBackwardPushStack(sut.firstStack)
        
        //then
        print("\(result)")
        XCTAssertEqual(result, [3, 2, 1])
    }

}
