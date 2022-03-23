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
    self.clearAll()
  }
  
  @IBAction private func didTapKeyOperationButton(_ sender: UIButton) {
    guard let keyOperation = sender.titleLabel?.text else {
      return
    }
    switch keyOperation {
    case "AC":
      self.clearAll()
    case "CE":
      self.clearEntry()
    case "⁺⁄₋":
      self.convertSign()
    default: break
    }
  }
  
  @IBAction private func didTapOperatorButton(_ sender: UIButton) {}
  @IBAction private func didTapNumberButton(_ sender: UIButton) {}
}

// MARK: - Private Extension

private extension CalculatorViewController {
  
  func clearAll() {
    self.formulas.removeAll()
    self.operatorLabel.text = nil
    self.operandLabel.text = Double.zero.formatString()
    self.resultStackView.arrangedSubviews.forEach {
      self.resultStackView.removeArrangedSubview($0)
    }
  }
  
  func clearEntry() {
    self.operandLabel.text = Double.zero.formatString()
  }
  
  func convertSign() {
    guard let operand = self.operandLabel.text,
          let number = Double(operand)
    else {
      return
    }
    let newNumber = number * -1
    let result = newNumber == .zero ? .zero : newNumber
    self.operandLabel.text = result.formatString()
  }
}
