//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by unchain123 on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_숫자5를_넣었을때_head에_5가_들어있는지확인() {
        //given
        let input:Double = 5
        
        //when
        sut.linkedList.append(data: input)
        let result:Double? = sut.linkedList.head?.data
        
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_숫자5를_linkedList_head에넣고_6을_likedList_head_next에넣었을때_5와6이_head와_headnext에들어있는지확인() {
        //given
        let input:Double = 5
        let secondInput:Double = 6
        
        //when
        sut.linkedList.append(data: input)
        sut.linkedList.append(data: secondInput)
        let firstValue:Double? = sut.linkedList.head?.data
        let secondValue:Double? = sut.linkedList.head?.next?.data
        //then
        
        XCTAssertEqual(firstValue, input)
        XCTAssertEqual(secondValue, secondInput)
    }
    
    func test_3개의데이터를넣으면카운트가3인지() {
        //given
        let input:Double = 5
        let expeted = 3
        
        //when
        for _ in 1...3 {
            sut.linkedList.append(data: input)
        }
        let result = sut.linkedList.count
        
        //then
        
        XCTAssertEqual(result, expeted)
    }
    
    func test_remove함수를_사용하면_head값이바뀌는지() {
        //given
        let inputArray:[Double] = [1, 3, 5]
        let expeted:Double = 3
        
        //when
        for input in inputArray {
            sut.linkedList.append(data: input)
        }
        sut.linkedList.remove()
        let result:Double? = sut.linkedList.head?.data
        
        //then
        XCTAssertEqual(result, expeted)
    }
    
    func test_리스트내에_값이없을때_remove하면_nil을_반환하는지() {
        sut.linkedList.remove()
        
        XCTAssertEqual(sut.linkedList.head?.data, nil)
    }
    
    func test_모든값을_없앴는지_카운트로확인() {
        //given
        let inputArray:[Double] = [1, 3, 5]
        let expeted = 0
        
        //when
        for input in inputArray {
            sut.linkedList.append(data: input)
        }
        sut.linkedList.removeAll()
        let result = sut.linkedList.count
        
        //then
        XCTAssertEqual(result, expeted)
    }
    
    func test_리스트에서_빠진_헤드값을_그대로_반환하는지() {
        //given
        let inputArray:[Double] = [1, 3, 5]
        let expeted:Double = 1
        //when
        for input in inputArray {
            sut.linkedList.append(data: input)
        }
        let test = sut.linkedList.peekRemove()
        
        //then
        XCTAssertEqual(test, expeted)
}
}
