//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by idinaloq on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_값을enqueue하면_정상적으로추가되는지() {
        let input = 1
        
        sut.enqueue(input)
        
        
        //XCTAssertEqual(enqueueData, input)
        
    }
    
    
    /// given
    
    /// when
    
    /// then


}
