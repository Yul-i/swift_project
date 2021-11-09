//
//  Page2ViewController.swift
//  test06
//
//  Created by apple on 2021/11/03.
//

import UIKit
import WebKit

class Page2ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebPage("http://www.youtube.com")

    }
    
    func checkUrl(_ url: String) -> String {
       var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGoTo(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://www.naver.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://www.inflearn.com")
    }
    
    @IBAction func btnHTML(_ sender: UIButton) {
        let htmlString =
            """
                <h1> HTML String </h1>
                <p> String 변수를 이용한 웹페이지 </p>
                <p><a href=\"http://www.daum.net\">daum</a>으로 이동</p>
            """
                myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView2", ofType: "html")
                let myUrl = URL(fileURLWithPath: filePath!)
                let myRequest = URLRequest(url: myUrl)
                myWebView.load(myRequest)
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
