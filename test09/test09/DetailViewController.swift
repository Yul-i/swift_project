//
//  DetailViewController.swift
//  test09
//
//  Created by apple on 2021/11/16.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""

    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
    }
    
    func receiveItem(_ item:String){
        receiveItem = item
    }

}
