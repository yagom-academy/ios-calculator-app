//
//  String+.swift
//  Calculator
//
//  Created by MARY on 2023/06/16.
//

import Foundation

extension String {
    func changeNumberFormat() -> String? {
        guard let number = Double(self) else { return nil }

        return number.changeNumberFormat()
    }
}
