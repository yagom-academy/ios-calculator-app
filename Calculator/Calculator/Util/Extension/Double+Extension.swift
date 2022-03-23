//
//  Double+Extension.swift
//  Calculator
//
//  Created by Lingo on 2022/03/15.
//

import Foundation

extension Double: CalculateItem {
  
  func formatString() -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(for: self)
  }
}
