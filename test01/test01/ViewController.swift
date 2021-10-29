//
//  ViewController.swift
//  test01
//
//  Created by apple on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("swift start!!!")
        
        
    }
    
    @IBAction func button1Click(_ sender: Any) {
        print("button을 클릭하셨군요")
    }
    
    @IBAction func button2Click(_ sender: Any) {
        print("button2를 클릭하셨군용")
    }
    
    

}

