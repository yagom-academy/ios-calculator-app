//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var numberLabel: UILabel!
  @IBOutlet private weak var operatorbutton: UILabel!
  @IBOutlet private weak var processScrollView: UIScrollView!
  @IBOutlet private weak var processStackView: UIStackView!
  
  private var fomula = Asset.blank
  
  private var visibleNumber = Asset.blank {
    didSet{
      convertNumberLabelToformatter()
    }
  }
  
  private var visibleOperator = Asset.blank {
    didSet{
      self.operatorbutton.text = visibleOperator
    }
  }
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    self.processStackView.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
  }
  
  @IBAction func tapNumber(_ sender: UIButton) {
    
    guard let inputString = sender.titleLabel?.text else {
      return
    }
    
    if visibleNumber.first == "0" && visibleNumber.contains(Asset.dot) == false {
      visibleNumber.removeAll()
      visibleNumber.append(inputString)
    } else if visibleNumber == Asset.doubleZero {
      visibleNumber.removeAll()
      visibleNumber.append(inputString)
    } else {
      visibleNumber.append(inputString)
    }
    
    if visibleNumber == Asset.zeroZero {
      visibleNumber = Asset.zero
    }
  }
    
  @IBAction func tapPlusMinus(_ sender: UIButton) {
    
    guard visibleNumber != Asset.blank else {
      return
    }
    
    if visibleNumber.first == "-" {
      visibleNumber = visibleNumber.trimmingCharacters(in: ["-"])
    } else {
      visibleNumber = String(visibleNumber.reversed())
      visibleNumber.append(Asset.minus)
      visibleNumber = String(visibleNumber.reversed())
    }
  }
  
  @IBAction func tapDot(_ sender: UIButton) {
    
    if visibleNumber.contains(Asset.dot) == false {
      visibleNumber.append(Asset.dot)
    }
  }
  
  @IBAction func tapOperator(_ sender: UIButton) {
    
    guard let inputOperator = sender.titleLabel?.text else {
      return
    }
    
    guard visibleNumber != Asset.blank else {
      return
    }
    
    processStackView.addArrangedSubview(makeStackView(visibleOperator, self.numberLabel.text ?? errorString.Error))
    self.processScrollView.scrollToBottom()

    if visibleNumber != Asset.blank {
      fomula += visibleNumber
      fomula += Asset.spacing
    }
    
    visibleOperator.removeAll()
    visibleOperator.append(inputOperator)
    fomula += visibleOperator
    fomula += Asset.spacing
    visibleNumber.removeAll()
  }
  
  @IBAction func tapAC(_ sender: UIButton) {
    
    visibleOperator.removeAll()
    visibleNumber.removeAll()
    self.processStackView.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
    visibleNumber = Asset.zero
  }
  
  @IBAction func tapCE(_ sender: UIButton) {
    
    visibleNumber.removeAll()
    visibleNumber = Asset.zero
  }
  
  @IBAction func tapResult(_ sender: UIButton) {
    
    fomula += visibleNumber
    processStackView.addArrangedSubview(makeStackView(visibleOperator, self.numberLabel.text ?? errorString.Error))
    self.processScrollView.scrollToBottom()
    visibleNumber.removeAll()
    visibleOperator.removeAll()
    let result = ExpressionParser.parse(from: fomula).result()
    fomula = Asset.blank
    
    switch result {
    case .success(let resultValue):
      visibleNumber = String(resultValue)
    case .failure(let error):
      visibleNumber = error.errorDescription ?? errorString.notFoundError
    }
  }
}

private extension ViewController {
  
  func makeStackView(_ operatorString: String, _ numberString: String) -> UIStackView {
    let stackView = UIStackView()
    stackView.spacing = 10
    
    [makeLabel(operatorString),
     makeLabel(numberString)].forEach {
      stackView.addArrangedSubview($0)
    }
    return stackView
  }
  
  func makeLabel(_ inputinformation: String) -> UILabel {
    let label = UILabel()
    
    label.text = inputinformation
    label.textColor = .white
    return label
  }
  
  func convertNumberLabelToformatter() {
    let numberFormatter = NumberFormatter()
    guard let doubleNumber = Double(visibleNumber) else {
      return
    }
      
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 20
    self.numberLabel.text = numberFormatter.string(for: doubleNumber)
  }
}

extension UIScrollView {
  func scrollToBottom() {
    
    layoutIfNeeded()
    let bottomOffset = CGPoint(x: Double.zero, y: contentSize.height - bounds.size.height)
    setContentOffset(bottomOffset, animated: true)
  }
}

