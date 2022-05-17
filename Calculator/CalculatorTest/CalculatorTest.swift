//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by Baek on 2022/05/17.
//

import XCTest

class CalculatorTest: XCTestCase {
    
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isEmpty호출시_비어있으면_true반환하는지() {
        //given
        sut.formulaQueue = []
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty호출시_비어있지않으면_False반환하는지() {
        //given
        sut.formulaQueue = ["1"]
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    
    
    func test_peek함수가_첫번째배열을가져오는지() {
        //given
        sut.formulaQueue = ["1", "2", "3"]
        let testNumber = "1"
        
        //when
        let peekGetNumber = sut.peek
        
        //then
        XCTAssertEqual(testNumber, peekGetNumber)
    }
    
    func test_enQueue함수를_사용해_1_2_3_이순서대로들어가는지() {
        //given
        let testNumbers = ["1", "2" ,"3"]
        
        //when
        sut.enQueue("1")
        sut.enQueue("2")
        sut.enQueue("3")
        
        //then
        XCTAssertEqual(testNumbers, sut.formulaQueue)
    }
    
    func test_deQueue_배열애아무것도없을때_nil반환하는지() {
        //given
        sut.formulaQueue = []
        
        //when
        let result = sut.deQueue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_deQueue_배열에서_맨앞에_갚을제거하는지() {
        //given
        sut.formulaQueue = ["1", "2", "3"]
        let testNumber = ["2", "3"]
        
        //when
        sut.deQueue()
        
        //then
        XCTAssertEqual(testNumber, sut.formulaQueue)
    }
    
    

}
