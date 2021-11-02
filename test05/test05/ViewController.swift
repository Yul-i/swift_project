//
//  ViewController.swift
//  test05
//
//  Created by apple on 2021/11/02.
//

import UIKit

class ViewController: UIViewController {

    var imgOn : UIImage?//아무것도 안넣었으니 ?을 붙여줘서 nil을 허용한다.
    var imgOff : UIImage?
    var isZoom = false//boolean은 nil이 없어서 ?가 안붙는다.
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //객체 생성
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        //이미지 넣어주기
        imgView.image = imgOn
        
    }
    @IBAction func btnResizeImg(_ sender: UIButton) {
        let scale : CGFloat = 2//CGFloat 시스템에 따라 유동적으로 움직임
        var newWidth : CGFloat = 0
        var newHeight : CGFloat = 0
        
        if isZoom {
            btnResize.setTitle("확대", for: .normal)
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
        }else{
            btnResize.setTitle("축소", for: .normal)
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
        }
        
        isZoom = !isZoom
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    @IBAction func switchImgOnOff(_ sender: UISwitch) {
        if sender.isOn {//입력값으로 들어온 UISwitch의 상태
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
    
    
    @IBAction func page2Next(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page2") else {
            return //nil일 때 실행됨.!
        }
        self.present(go, animated: true)
    }
    
}

