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
        sut?.enQueue(input)
        let result = 4.0
        
        //then
        XCTAssertEqual(result, sut?.enQueueStack.last)
    }
    
    func test_enQueueStack에_값이없다면_deQueue함수를_호출하면_nil을반환하는가() {
        //given
        
        //when
        var result: Double?
        func result() throws {
            do {
                result = try sut?.deQueue()
            } catch  {
                throw QueueError.empty
            }
        }
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_enQueue를세번호출하고_deQueue를_2번호출해도_값이잘넘어가는가() {
        //given
        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
        
        //when
        var result1: Double?
        var result2: Double?
        
        do {
            result1 = try sut?.deQueue()
        } catch  {
            print("nil 값을 반환하지 않음!")
        }
        
        do {
            result2 = try sut?.deQueue()
        } catch  {
            print("nil 값을 반환하지 않음!")
        }
        
        //then
        XCTAssertEqual(result1, 1.0)
        XCTAssertEqual(result2, 2.0)
    }
    
    func test_deQueue함수를_호출했을때_deQueueStack이_비어있으면_enQueueStack의순서를뒤집어_deQueueStack에집어넣는가() {
        //given
        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
        
        //when
        var result1: Double?
        var result2: Double?
        var result3: Double?
        
        do {
            result1 = try sut?.deQueue()
        } catch  {
            print("error1")
        }
        
        do {
            result2 = try sut?.deQueue()
        } catch  {
            print("error2")
        }
        
        do {
            result3 = try sut?.deQueue()
        } catch  {
            print("error3")
        }
        
        //then
        XCTAssertEqual(result1, 1.0)
        XCTAssertEqual(result2, 2.0)
        XCTAssertEqual(result3, 3.0)

       
    }
    
    func test_deQueue함수를_호출했을때_deQueueStack의배열에서_마지막값을반환하는가() {
        //given

        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
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

        sut?.enQueue(1.0)
        sut?.enQueue(2.0)
        sut?.enQueue(3.0)
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
