//
//  Page1ViewController.swift
//  test04
//
//  Created by apple on 2021/11/01.
//

import UIKit

class Page1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func page4Act(_ sender: UIButton) {
        
        //옵셔널 바인딩 : nil인 경우에는 함수를 더이상 실행하지 않고, 원래 호출한 곳으로 return 하고
        //            nil이 아닌 경우 해당주소를 변수에 넣는 처리를 해라!
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page4") else {
                   return //nil일 때 실행됨.!
               }
               self.present(go, animated: true)
    }
    
    @IBAction func back1Act(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
