//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Lingo, mmim on 2022/03/28.
//

import UIKit

final class CalculatorViewController: UIViewController {
  
  @IBOutlet private weak var resultScrollView: UIScrollView!
  @IBOutlet private weak var resultStackView: UIStackView!
  @IBOutlet private weak var operatorLabel: UILabel!
  @IBOutlet private weak var operandLabel: UILabel!
  
  private let viewModel = CalculatorViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.bindUI()
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
  
  @IBAction private func didTapCalculateButton(_ sender: UIButton) {
    guard let stackView = self.makeSubResultStackView() else {
      return
    }
    if self.viewModel.calculate() {
      self.resultStackView.addArrangedSubview(stackView)
    }
  }
  
  @IBAction private func didTapOperatorButton(_ sender: UIButton) {
    guard let operatorString = sender.titleLabel?.text,
          let stackView = self.makeSubResultStackView()
    else {
      return
    }
    if self.viewModel.addOperator(of: operatorString) {
      self.resultStackView.addArrangedSubview(stackView)
      self.resultScrollView.scrollToBottom()
    }
  }
  
  @IBAction private func didTapNumberButton(_ sender: UIButton) {
    guard let numberString = sender.titleLabel?.text else {
      return
    }
    if self.viewModel.isResult {
      self.resultStackView.arrangedSubviews.forEach {
        $0.removeFromSuperview()
      }
    }
    self.viewModel.addOperand(of: numberString)
  }
  
  @IBAction private func didTapDotButton(_ sender: UIButton) {
    self.viewModel.addDot()
  }
}

// MARK: - Private Extension

private extension CalculatorViewController {
  
  func bindUI() {
    self.viewModel.operatorType.bind { [weak self] operatorType in
      self?.operatorLabel.text = operatorType
    }
    self.viewModel.operandValue.bind { [weak self] operand in
      let splitedOperand = operand.split(with: ".")
      self?.operandLabel.text = self?.makeOperandLabel(splitedOperand)
    }
  }
  
  func makeOperandLabel(_ splitedOperand: [String]) -> String? {
    guard let integerString = splitedOperand.first,
          let integer = Double(integerString)
    else {
      return nil
    }
    var result = integer.formatString()
    if self.viewModel.isDotted,
        let decimal = result,
        let fraction = splitedOperand.last
    {
      result = "\(decimal).\(fraction)"
    }
    if self.viewModel.isResult,
        let numberString = result?.replacingOccurrences(of: ",", with: ""),
        let number = Double(numberString)?.formatString()
    {
      result = number
    }
    return result
  }
  
  func clearAll() {
    self.viewModel.clearAll()
    self.resultStackView.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
  }
  
  func clearEntry() {
    self.viewModel.clearEntry()
  }

  func convertSign() {
    self.viewModel.convertSign()
  }
  
  func makeSubResultStackView() -> UIStackView? {
    guard let operand = Double(self.viewModel.operandValue.value) else {
      return nil
    }
    let operatorType = self.viewModel.operatorType.value
    let stackView = UIStackView(type: operatorType, operand: operand.formatString())
    return stackView
  }
}
