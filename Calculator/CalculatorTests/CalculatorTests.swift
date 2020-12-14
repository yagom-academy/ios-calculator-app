//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Wonhee on 2020/12/14.
//

import XCTest
@testable import Calculator

final class BinaryCalculatorTests: XCTestCase {

    private var binaryCalculator: BinaryCalculator!
    
    override func setUp() {
        binaryCalculator = BinaryCalculator()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        binaryCalculator = nil
    }
}
