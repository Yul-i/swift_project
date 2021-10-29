//
//  ViewController.swift
//  test02
//
//  Created by apple on 2021/10/29.
//

import UIKit

class Page2: UIViewController {
    //아울렛 변수
    @IBOutlet weak var button2_1: UIButton!
    @IBOutlet weak var button2_2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button2_1Action(_ sender: Any) {
        print("2페이지에서 버튼1를 클릭")
    }
    
    @IBAction func button2_2Action(_ sender: Any) {
        print("2페이지에서 버튼2를 클릭")
    }
    
}

