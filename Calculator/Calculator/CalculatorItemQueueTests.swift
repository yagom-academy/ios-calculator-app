//
//  CalculatorItemQueueTests.swift
//  Calculator
//
//  Created by 서수영 on 2022/09/23.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue([])
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    

}
