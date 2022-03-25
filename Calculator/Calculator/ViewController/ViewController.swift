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
  
  private var fomula = ""
  
  private var visibleNumber = ""{
    didSet{
      let doubleNumber = Double(visibleNumber)
      guard doubleNumber != nil else {
        return self.numberLabel.text = visibleNumber
      }
      self.numberLabel.text = makeformatter().string(for: doubleNumber)

    }
  }
  
  private var visibleOperator = ""{
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
    
    if visibleNumber.first == "0" && visibleNumber.contains(".") == false {
      visibleNumber.removeAll()
      visibleNumber.append(inputString)
    } else if visibleNumber == "0.0"  {
      visibleNumber.removeAll()
      visibleNumber.append(inputString)
    } else {
      visibleNumber.append(inputString)
    }
    
    if visibleNumber == "00" {
      visibleNumber = "0"
    }
  }
  
  @IBAction func tapPlusMinus(_ sender: UIButton) {
    
    guard visibleNumber != "" else {
      return
    }
    
    if visibleNumber.first == "-" {
      visibleNumber = visibleNumber.trimmingCharacters(in: ["-"])
    } else {
      visibleNumber = String(visibleNumber.reversed())
      visibleNumber.append("-")
      visibleNumber = String(visibleNumber.reversed())
    }
  }
  
  @IBAction func tapDot(_ sender: UIButton) {
    
    if visibleNumber.contains(".") == false {
      visibleNumber.append(".")
    }
  }
  
  @IBAction func tapOperator(_ sender: UIButton) {
    let doubleNumber = Double(visibleNumber)
    
    guard let inputOperator = sender.titleLabel?.text else {
      return
    }
    
    guard visibleNumber != "" else {
      return
    }
    
    guard let formatNumber = makeformatter().string(for: doubleNumber) else {
      return
    }
    
    processStackView.addArrangedSubview(makeStackView(visibleOperator, formatNumber))
    self.processScrollView.scrollToBottom()

    if visibleNumber != "" {
      fomula += visibleNumber
      fomula += " "
    }
    
    visibleOperator.removeAll()
    visibleOperator.append(inputOperator)
    fomula += visibleOperator
    fomula += " "
    visibleNumber.removeAll()
  }
  
  @IBAction func tapAC(_ sender: UIButton) {
    
    visibleOperator.removeAll()
    visibleNumber.removeAll()
    self.processStackView.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
    visibleNumber = "0"
  }
  
  @IBAction func tapCE(_ sender: UIButton) {
    visibleNumber.removeAll()
    visibleNumber = "0"
  }
  
  @IBAction func tapResult(_ sender: UIButton) {
    let doubleNumber = Double(visibleNumber)
    
    guard let formatNumber = makeformatter().string(for: doubleNumber) else {
      return
    }
    
    fomula += visibleNumber
    processStackView.addArrangedSubview(makeStackView(visibleOperator, formatNumber))
    self.processScrollView.scrollToBottom()

    visibleNumber.removeAll()
    visibleOperator.removeAll()
    
    let result = ExpressionParser.parse(from: fomula).result()
    fomula = ""
    
    switch result {
    case .success(let resultValue):
      visibleNumber = String(resultValue)
    case .failure(let error):
      visibleNumber = error.errorDescription ?? "404"
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
  
  func makeformatter() -> NumberFormatter{
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 20
    return numberFormatter
  }
}

extension UIScrollView {
  func scrollToBottom() {
    layoutIfNeeded()
    let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
    setContentOffset(bottomOffset, animated: true)
  }
}

