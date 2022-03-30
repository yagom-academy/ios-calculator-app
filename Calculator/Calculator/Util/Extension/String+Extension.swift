//
//  String+Extension.swift
//  Calculator
//
//  Created by Lingo, mmim on 2022/03/28.
//

extension String {
  
  func split(with target: Character) -> [String] {
    return self.components(separatedBy: String(target))
  }
}
