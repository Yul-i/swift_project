//
//  Page2ViewController.swift
//  test05
//
//  Created by apple on 2021/11/02.
//

import UIKit

class Page2ViewController: UIViewController {

    @IBOutlet var imgViewer: UIImageView!
    var img : UIImage?
    var listNum = 0
    var imgList : [ String ] = ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

       
        img = UIImage(named: imgList[listNum])
    }
    
    
    @IBAction func btnLeft(_ sender: UIButton) {
        if listNum == 0 {
//            listNum = imgList.count - 1
//            img = UIImage(named: imgList[listNum])
                
            let alert = UIAlertController(title: "체크!!", message: "첫 페이지 입니다.", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "확인", style: .default) {
                            action in
                                  })
              self.present(alert, animated: true, completion: nil)
        }else{
            listNum = listNum - 1
            img = UIImage(named: imgList[listNum])
        }
        imgViewer.image = img
    }
    
    @IBAction func btnRight(_ sender: UIButton) {
        if listNum == imgList.count - 1 {
//            listNum = 0
//            img = UIImage(named: imgList[listNum])
        let alert = UIAlertController(title: "체크!!", message: "마지막 페이지 입니다.", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "확인", style: .default) {
                        action in
                              })
          self.present(alert, animated: true, completion: nil)
            
        }else{
            listNum = listNum + 1
            img = UIImage(named: imgList[listNum])
        }
        imgViewer.image = img
    }
    
    
    @IBAction func page3Next(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page3") else {
            return //nil일 때 실행됨.!
        }
        self.present(go, animated: true)
    }
    
    @IBAction func backPage1(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
