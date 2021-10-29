//
//  ViewController.swift
//  test02
//
//  Created by apple on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {
    //아울렛 변수
    @IBOutlet var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //액션 함수
    @IBAction func button1Click(_ sender: Any) {
        let alert = UIAlertController(title: "알림", message: "얼럿 메세지 입니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default) { [self] action in
                    self.button1.setTitle("확인완료", for: .normal)
                })
                self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func button2Click(_ sender: Any) {
        
    }
}

