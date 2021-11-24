//
//  ContactManager.swift
//  test08_03
//
//  Created by apple on 2021/11/18.
//

import UIKit

class ContactManager: UIViewController {
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var confirmText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "nextPage") as? NextManager else {return}
                       //넘어갈 값을 지정
        go.name = nameText.text!
        go.email = emailText.text!
                       self.present(go, animated: true)
    }
    
    @IBAction func btnRead(_ sender: UIButton) {
        confirmText.text = "\(nameText.text!) \(emailText.text!)"
    }
    
    
}
