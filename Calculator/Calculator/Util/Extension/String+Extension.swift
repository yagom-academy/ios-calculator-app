//
//  String+Extension.swift
//  Calculator
//
//  Created by Lingo on 2022/03/18.
//

extension String {
  
  func split(with target: Character) -> [String] {
    return self.components(separatedBy: String(target))
  }
}
