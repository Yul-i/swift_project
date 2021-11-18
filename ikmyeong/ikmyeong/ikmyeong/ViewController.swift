//
//  ViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {
    
    //이름
    @IBOutlet var ikName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnName(_ sender: UIButton) {
        let name = ikName.text!
        
        if name == "" {
            let alert = UIAlertController(title: "익명이의 이름", message: "익명이의 이름을 작성해줘!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
            })
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "익명이의 이름", message: "<\(name)> 이 이름으로 할거야?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .default) { action in
                self.ikName.text = ""
            })
            alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
                guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page2") as? Page2ViewController else {return}
                            //넘어갈 값을 지정
                            go.name = name
                            self.present(go, animated: true)
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

