//
//  ViewController.swift
//  test03
//
//  Created by apple on 2021/10/29.
//

import UIKit

class Page02: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var btnAge: UIButton!
    
    var result = 0//타입추정
    var result2 = 0//타입추정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        let n1 = 100
        let n2 = 200
        result = n1+n2
    }

    @IBAction func btnAgeAction(_ sender: UIButton) {
        print("result 결과",result)
        let n3 = txtName.text!
        let n4 = Int(txtAge.text!)! + 1
        
        lblAge.text = n3 + "의 나이는 " + String(n4) + "세 입니다."
    }
    
    
}

