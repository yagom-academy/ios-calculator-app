//
//  Calculator - ViewController.swift
//  Created by unchain123
//
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class Node<T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

