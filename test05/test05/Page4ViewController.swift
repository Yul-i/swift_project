//
//  Page4ViewController.swift
//  test05
//
//  Created by apple on 2021/11/02.
//

import UIKit

class Page4ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var imgDesc: UILabel!
    
    var imgUp : UIImage?
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imgUp = UIImage(named: name)
        imgView.image = imgUp
        imgDesc.text = name
    }
    
    @IBAction func page3Back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

}
