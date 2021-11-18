//
//  Page3ViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/04.
//

import UIKit

class Page3ViewController: UIViewController {
    
    var nameTitle : String = ""
    var image : String = ""
    var desc : String = ""
    
    var img : UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleView: UILabel!
    @IBOutlet var desView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이미지 넣어주기
        img = UIImage(named: image)
        imgView.image = img
        
        //타이틀 넣어주기
        titleView.text = nameTitle
        
        //설명 넣어주기
        desView.text = desc
    }
    
    @IBAction func btnBefore(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

}
