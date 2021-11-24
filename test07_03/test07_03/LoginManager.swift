//
//  LoginManager.swift
//  test07_03
//
//  Created by apple on 2021/11/04.
//

import UIKit

class LoginManager: UIViewController {

    @IBOutlet var idText: UITextField!
    @IBOutlet var pwText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
    }
    
    @IBAction func loginAct(_ sender: UIButton) {
        var id = idText.text!
        var pw = pwText.text!
        
        let systemId = "root"
        let systemPw = "1234"
    
        
        if id == systemId && pw == systemPw {
            let alert = UIAlertController(title: "로그인 결과", message: "아이디/패스워드가 동일합니다.", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "확인", style: .default) {
                                    action in
                                          })
                      self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "로그인 결과", message: "아이디 혹은 패스워드가 동일하지 않습니다.", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "확인", style: .default) {
                                    action in
                                          })
                      self.present(alert, animated: true, completion: nil)
        }
    }
    
}
