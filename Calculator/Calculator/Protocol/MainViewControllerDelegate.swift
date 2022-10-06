//  Calculator - MainViewControllerDelegate.swift
//  Created by zhilly and Gundy on 2022/10/06.

import UIKit

protocol MainViewControllerDelegate {
    var displaySignLabel: UILabel! { get set }
    var displayNumberLabel: UILabel! { get set }
    func makeStackView()
    func resetDisplayNumberLabel()
}
