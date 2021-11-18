//
//  webViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/18.
//

import UIKit
import WebKit

class webViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url:String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage("https://www.ikmyeongshop.com/")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}
