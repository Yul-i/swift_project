//
//  Page3ViewController.swift
//  test04
//
//  Created by apple on 2021/11/01.
//

import UIKit

class Page3ViewController: UIViewController {

    @IBOutlet var foodText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func foodAct(_ sender: UIButton) {
        let food = foodText.text!
        print("좋아하는 음식은\(food)")
        let alert = UIAlertController(title: "좋아하는 음식", message: "선택한 음식은>>>\(food)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) {
                      action in
                        print("확인을 누름")
                            })//alert end
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func orderAct(_ sender: UIButton) {
        let food = foodText.text!
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page6") as? Page6ViewController else {return}
                    go.food = food;
                    self.present(go, animated: true)
    }
    
}
