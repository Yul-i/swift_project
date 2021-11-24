//
//  DiaryManager.swift
//  test08_01
//
//  Created by apple on 2021/11/18.
//

import UIKit

class DiaryManager: UIViewController {
    
    
   
    @IBOutlet var titleText: UITextField!
    @IBOutlet var contentText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        titleText.text = ""
        contentText.text = ""
    }
    
    
    @IBAction func btnCheck(_ sender: UIButton) {
        let title = titleText.text!
        let content = contentText.text!
        
        let alert = UIAlertController(title: "일기장", message: "제목:"+title+"내용:"+content, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "확인", style: .default) {
                        action in
                              })
          self.present(alert, animated: true, completion: nil)

    }
    
}
