//
//  ViewController.swift
//  test03
//
//  Created by apple on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSendAction(_ sender: UIButton) {
        print("이름은 ", textName.text!)
        print("나이는 ", textAge.text!)
        lblHello.text = textName.text! + "는 " + textAge.text! + "입니다."
    }
    
}

