//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var a = LinkedList<Int>()
        a.append(2)
        a.append(3)
        a.append(4)
        print(a.head?.data)
        print(a.head?.next?.data)
        print(a.head?.next?.next?.data)
        a.removeLast()
        print(a.head?.data)
        print(a.head?.next?.data)
        print(a.head?.next?.next?.data)
    }


}

