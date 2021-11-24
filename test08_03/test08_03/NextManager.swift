//
//  NextManager.swift
//  test08_03
//
//  Created by apple on 2021/11/18.
//

import UIKit

class NextManager: UIViewController {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    
    var name : String = ""
    var email : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = name
        lblEmail.text = email
        
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

}
