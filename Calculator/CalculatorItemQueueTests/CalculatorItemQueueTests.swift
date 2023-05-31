//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hyungmin Lee on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {

    var systemUnderTest: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        systemUnderTest = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }

    func test_3을_enqueue했을때_queue의Element를_확인한다() {
        //given
        let input = 3.0
        
        //when
        systemUnderTest.enqueue(element: input)
        let result = systemUnderTest.returnListValue()
        
        //then
        XCTAssertEqual(result, [3.0])
    }
    
    func test_3_4를_enqueue했을때_queue의Element를_확인한다() {
        //given
        let input1 = 3.0
        let input2 = 4.0
        //when
        systemUnderTest.enqueue(element: input1)
        systemUnderTest.enqueue(element: input2)
        let result = systemUnderTest.returnListValue()
        
        //then
        XCTAssertEqual(result, [3.0, 4.0])
    }
    
    func test_3_4_5_를_enqueue했을때_queue의Element를_확인한다() {
        
    }
}
