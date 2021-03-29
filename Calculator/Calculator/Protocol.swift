//
//  Protocol.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/27.
//

import Foundation

protocol InputDataValidatable {
    var userInput:[String] { get }
    var operators:[String] { get }

    func manageData(input: String)
}

protocol Calculatable {

    typealias precedence = Int

    var operatorPriority: [String : precedence] { get }
    var medianNotation: [String] { get }
    var postfixNotation: [String] { get }
    var operatorStack: Stack<String> { get }

    func convertToPostfixNotation()


}

