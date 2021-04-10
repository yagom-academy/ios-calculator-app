//
//  GetStack.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/29.
//

import Foundation

protocol GetStack {
    associatedtype T
    var stack: Stack<T> { get set }
}
