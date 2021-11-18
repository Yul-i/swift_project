//
//  DetailViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/18.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name = ""
    var descript = ""
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblTitle.text = name
        lblDesc.text = descript
    }
    
    func receiveItem(_ ikName:String, _ ikDesc:String){
        name = ikName
        descript = ikDesc
    }
    

}
