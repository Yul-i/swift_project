//
//  AddViewController.swift
//  test09
//
//  Created by apple on 2021/11/16.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    


}
