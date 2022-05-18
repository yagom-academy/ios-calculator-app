//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김동용 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enQueue함수를_호출했을때_enQueueStack에_값을더하는가() {
        //given
        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
        let input = 4.0
        
        //when
        sut?.enQueueStack.append(input)
        let result = 4.0
        
        //then
        XCTAssertEqual(result, sut?.enQueueStack.last)
    }
    
    func test_enQueueStack에_값이없다면_deQueue함수를_호출하면_nil을반환하는가() {
        //given
        let result = sut?.enQueueStack
        //when

        do {
            try sut?.deQueue()
        } catch  {
            print("nil 값을 반환하지 않음!")
        }
        //then
        XCTAssertNil(result)
    }
    
    func test_deQueue함수를_호출했을때_deQueueStack이_비어있으면_enQueueStack의순서를뒤집어_deQueueStack에집어넣는가() {
        //given
        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
        var result: Double?
        
        //when
        for elements in 1...3 {
            do {
                result = try sut?.deQueue()
            } catch  {
                print("실패!")
            }
        }
        
        //then
        XCTAssertEqual(sut?.deQueueStack, [3.0, 2.0, 1.0])
    }
    
   
    
    func test_deQueue함수를_호출했을때_enQueueStack의순서를뒤집어_deQueueStack에집어넣었으면_enQueueStack의요소를_모두없애는가() {
        //given
        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
        var input: Double?
        
        do {
            input = try sut?.deQueue()
        } catch  {
            print("nil 값을 반환하지 않음!")
        }
        
        //when
        if sut?.enQueueStack.reversed() == sut?.deQueueStack {
            sut?.enQueueStack.removeAll()
        }
        
        let result = sut?.enQueueStack
        
        //then
        XCTAssertEqual(result, [])
    }
    
    func test_deQueue함수를_호출했을때_deQueueStack의배열에서_마지막값을반환하는가() {
        //given
        sut?.enQueueStack = [1.0, 2.0, 3.0]
        sut?.deQueueStack = [3.0, 2.0, 1.0]
        var result: Double?
        
        //when
        do {
            result = try sut?.deQueue()
        } catch  {
            print("nil 값을 반환하지 않음!")
        }
        
        //then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_deQueueStack이_비어있을때_enQueue함수를_호출하고_deQueue를호출하면_값이제대로_넘어가는가() {
        //given
        sut?.enQueueStack = [1.0, 2.0, 3.0]
        sut?.deQueueStack = []
        sut?.enQueue(4.0)
        var result: Double?
        
        //when
        do {
            result = try sut?.deQueue()
        } catch  {
            print("nil 값을 반환하지 않음!")
        }
        
        //then
        XCTAssertEqual(result, 1.0)
    }
}
