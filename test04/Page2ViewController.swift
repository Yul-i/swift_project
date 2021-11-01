//
//  Page2ViewController.swift
//  test04
//
//  Created by apple on 2021/11/01.
//

import UIKit

class Page2ViewController: UIViewController {


    @IBOutlet var idText: UITextField!
    @IBOutlet var pwText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func page5Act(_ sender: UIButton) {
        //입력한 id값 가지고 오고,
        //입력한 pw값 가지고 오면 됨.
        let id = "root"
        let pw = "1234"
    
        //! : 강제 언랩핑(unwrapping)
        //객체로 만들어 진 것을 순수한 타입으로 변경
        //idText.text --> Optinal("root")
        //idText.text! --> "root"
        let id2 = idText.text!
        let pw2 = pwText.text!
        
        print("가지고 온 id2는 \(id2) ******")
        print("가지고 온 pw2는 \(pw2) ******")
        
        if id == id2 && pw == pw2 {
            print("인증 성공!!!@@@@@")
            
            guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page5") as? Page5ViewController else {return}
            //넘어갈 값을 지정
            go.key = "ok"
            go.result = "나도 넘어가보자"
            self.present(go, animated: true)
            
            let alert = UIAlertController(title: "인증 성공", message: "인증에 성공했습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                          action in
                                print("확인 창 눌렀음")
                                })//alert end
            self.present(alert, animated: true, completion: nil)
        } else {
            print("인증 실패!!!@@@@@")
            //Control2 class
            //let con2 = control2(n1:10, n2:20)
            let alert = UIAlertController(title: "인증 실패", message: "인증 실패함. 동일하지 않음", preferredStyle: .alert)
            //f.setFont(new Font())와 동일함
            //클로저 : 익명함수, 람다함수(메모리를 차지 하지 않는다)
            //java의 classforName ㅇ0ㅇ
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                          action in
                                print("확인 창 눌렀음")
                                })//alert end
            self.present(alert, animated: true, completion: nil)
        
        }//ifelse end
    }//button end
    
    @IBAction func back1Act(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
 
    

}
