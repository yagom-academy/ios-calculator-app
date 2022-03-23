//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var stackNumber: UILabel!
  @IBOutlet weak var `operator`: UILabel!
  
  var numberString = ""{
    didSet{
      self.stackNumber.text = numberString
    }
  }
  
  var operatorString = ""{
    didSet{
      self.`operator`.text = operatorString
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func tapNumber(_ sender: UIButton) {
    guard let inputString = sender.titleLabel?.text else {
      return
    }
    if numberString.first == "0" {
      numberString.removeAll()
      numberString.append(inputString)
    } else {
    numberString.append(inputString)
    }
    
    if numberString == "00" {
      numberString = "0"
    }
  }
  
  @IBAction func tapPlusMinus(_ sender: UIButton) {
    if numberString.first == "-" {
      numberString = numberString.trimmingCharacters(in: ["-"])
    } else {
      numberString = String(numberString.reversed())
      numberString.append("-")
      numberString = String(numberString.reversed())
    }
  }
  
  @IBAction func tapDot(_ sender: UIButton) {
    if numberString.contains(".") == false {
      numberString.append(".")
    }
  }
  
  @IBAction func tapOperator(_ sender: UIButton) {
    guard let inputOperator = sender.titleLabel?.text else {
      return
    }
    operatorString.removeAll()
    operatorString.append(inputOperator)
  }
  
  @IBAction func tapAC(_ sender: UIButton) {
    operatorString.removeAll()
    numberString.removeAll()
    numberString.append("0")
  }
  
  @IBAction func tapCE(_ sender: UIButton) {
  }
  
  @IBAction func tapResult(_ sender: UIButton) {
  }
}
