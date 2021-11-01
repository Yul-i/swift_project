//
//  Page5ViewController.swift
//  test04
//
//  Created by apple on 2021/11/01.
//

import UIKit

class Page5ViewController: UIViewController {
    
    var key = "" //String
    var result = ""//String
    
    
    @IBOutlet var keyLbl: UILabel!
    @IBOutlet var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("받은 키 값은 ", key)
        print("받은 결과값은 ", result)
        
        keyLbl.text = key;
        resultLbl.text = result;
        
    }
    
    @IBAction func back2Act(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

}
