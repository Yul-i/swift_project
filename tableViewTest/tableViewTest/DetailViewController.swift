//
//  DetailViewController.swift
//  tableViewTest
//
//  Created by Alicia Lim on 2021/11/07.
//

import UIKit

class DetailViewController: UIViewController {
    var receiveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = receiveItem
        // Do any additional setup after loading the view.
    }
    
    func receiveItem(_ item:String)  {
        receiveItem = item
    }

    
    // MARK: - Navigation

   
    

}
