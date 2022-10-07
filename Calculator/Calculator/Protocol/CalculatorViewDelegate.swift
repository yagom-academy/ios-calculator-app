//  Calculator - MainViewControllerDelegate.swift
//  Created by zhilly and Gundy on 2022/10/06.

import UIKit

protocol CalculatorViewDelegate {
    var displaySignLabel: UILabel! { get set }
    var displayNumberLabel: UILabel! { get set }
    func makeStackView()
    func resetDisplayNumberLabel()
}
