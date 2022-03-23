//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Lingo on 2022/03/14.
//

import UIKit

final class CalculatorViewController: UIViewController {
  
  @IBOutlet private weak var resultScrollView: UIScrollView!
  @IBOutlet private weak var resultStackView: UIStackView!
  @IBOutlet private weak var operatorLabel: UILabel!
  @IBOutlet private weak var operandLabel: UILabel!
  
  private var formulas: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction private func didTapKeyOperationButton(_ sender: UIButton) {
    guard let keyOperation = sender.titleLabel?.text else {
      return
    }
    switch keyOperation {
    case "AC":
      self.clear()
    case "CE": break
    case "⁺⁄₋": break
    default: break
    }
  }
  
  @IBAction private func didTapOperatorButton(_ sender: UIButton) {}
  @IBAction private func didTapNumberButton(_ sender: UIButton) {}
}

// MARK: - Private Extension

private extension CalculatorViewController {
  
  func clear() {
    self.formulas.removeAll()
    self.operatorLabel.text = nil
    self.operandLabel.text = Double.zero.formatString()
    self.resultStackView.arrangedSubviews.forEach {
      self.resultStackView.removeArrangedSubview($0)
    }
  }
}
