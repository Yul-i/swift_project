//
//  Page3ViewController.swift
//  test05
//
//  Created by apple on 2021/11/02.
//

import UIKit

class Page3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPage2(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        pass(imgName: "1.png")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        pass(imgName: "2.png")
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        pass(imgName: "3.png")
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        pass(imgName: "4.png")
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        pass(imgName: "5.png")
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        pass(imgName: "6.png")
    }
    
    func pass(imgName: String){
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page4") as? Page4ViewController else {return}
                    //넘어갈 값을 지정
                    go.name = imgName
                    self.present(go, animated: true)
    }
}
