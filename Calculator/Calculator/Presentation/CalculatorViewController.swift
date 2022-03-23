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
  
  @IBAction private func didTapNumberButton(_ sender: UIButton) {
    guard let number = sender.titleLabel?.text,
          let oldNumber = self.operandLabel.text
    else {
      return
    }
    if oldNumber == "0" {
      self.operandLabel.text = number
    } else {
      let newNumber = oldNumber + number
      self.operandLabel.text = newNumber
    }
  }
  
  @IBAction private func didTapOperatorButton(_ sender: UIButton) {
    guard let newOperatorType = sender.titleLabel?.text else {
      return
    }
    guard let number = self.operandLabel.text,
          Double(number) != 0
    else {
      self.operatorLabel.text = newOperatorType
      return
    }
    
    let stackView = self.makeResultSubStackView(
      operatorType: self.operatorLabel.text,
      operand: number
    )
    if let stackView = stackView {
      self.resultStackView.addArrangedSubview(stackView)
    }
    
    if let operatorType = self.operatorLabel.text {
      self.formulas.append(operatorType)
    }
    self.formulas.append(number)
    self.operatorLabel.text = newOperatorType
    self.operandLabel.text = "\(Int.zero)"
  }
  
  @IBAction private func didTapCalculateButton(_ sender: UIButton) {}
}

// MARK: - Private Extension

private extension CalculatorViewController {
  
  func clearAll() {
    self.formulas.removeAll()
    self.operatorLabel.text = nil
    self.operandLabel.text = Double.zero.formatString()
    self.resultStackView.arrangedSubviews.forEach {
      self.resultStackView.removeArrangedSubview($0)
      $0.removeFromSuperview()
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
  
  func makeResultSubStackView(operatorType: String?, operand: String?) -> UIStackView? {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8
    
    let operatorResultLabel = UILabel()
    operatorResultLabel.font = .preferredFont(forTextStyle: .title3)
    operatorResultLabel.textColor = .white
    operatorResultLabel.text = operatorType
    
    let operandResultLabel = UILabel()
    operandResultLabel.font = .preferredFont(forTextStyle: .title3)
    operandResultLabel.textColor = .white
    operandResultLabel.text = operand
    
    stackView.addArrangedSubview(operatorResultLabel)
    stackView.addArrangedSubview(operandResultLabel)
    
    return stackView
  }
}
