//
//  String+extension.swift
//  Calculator
//
//  Created by Ari on 2021/11/12.
//

import Foundation

extension String {
    func split(with target: Character = " ") -> [String] {
        self.split(separator: target).map{ String($0) }
    }
}
