//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 전민수 on 2022/05/16.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        sut = nil
    }

    func test_enqueue_enqueStack에_자연수가_순서대로_들어가는지_테스트() throws {
        let input1: Double = 1
        let input2: Double = 9999
        let expectation: [Double] = [1, 9999]
        
        var result = sut.enque(element: input1)
        result = sut.enque(element: input2)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueStack에_0과_음의정수가_순서대로_들어가는지_테스트() throws {
        let input1: Double = 0
        let input2: Double = -9999
        let expectation: [Double] = [0, -9999]

        var result = sut.enque(element: input1)
        result = sut.enque(element: input2)

        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueStack에_실수가_순서대로_들어가는지_테스트() throws {
        let input1 = 1.0
        let input2 = 2.0
        let expectation = [1.0, 2.0]
        
        var result = sut.enque(element: input1)
        result = sut.enque(element: input2)
        
        XCTAssertEqual(result, expectation)
    }
}
