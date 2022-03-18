//
//  ExpressionParser.swift
//  Calculator
//
//  Created by song on 2022/03/19.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
      split(separator: target).map{ String($0) }
    }
}

enum ExpressionParser {
  func parse(from input: String) {
    //Formula return
  }
}
