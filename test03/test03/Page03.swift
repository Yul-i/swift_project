//
//  ViewController.swift
//  test03
//
//  Created by apple on 2021/10/29.
//

import UIKit

class Page03: UIViewController {
    
    @IBOutlet var firstNum: UITextField!
    @IBOutlet var secondNum: UITextField!
    @IBOutlet var btnCarc: UIButton!
    @IBOutlet var lblPlus: UILabel!
    @IBOutlet var lblMulty: UILabel!
    @IBOutlet var lblMinus: UILabel!
    @IBOutlet var lblDi: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func resultAction(_ sender: UIButton) {
        var first = Int(firstNum.text!)
        print(first)
        var second = Int(secondNum.text!)
        var result = String(first!) + "+" + String(second!) + "=" + String(first!+second!)
        
        lblPlus.text = String(first!) + "+" + String(second!) + "=" + String(first!+second!)
        lblMinus.text = String(first!) + "-" + String(second!) + "=" + String(first!-second!)
        lblMulty.text = String(first!) + "*" + String(second!) + "=" + String(first!*second!)
        lblDi.text = String(first!) + "/" + String(second!) + "=" + String(first!/second!)
    }
    
}

