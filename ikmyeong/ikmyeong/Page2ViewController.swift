//
//  Page2ViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/04.
//

import UIKit

class Page2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    //앞 페이지에서 받아오는 이름
    var name : String = ""
        
    var selectTitle : String = ""
    var selectImage : String = ""
    var selectDesc : String = ""
    
    let MAX_ARRAY_NUM = 6
    let PICKER_VIEW_COLUMN = 1
    
    var imageName = ["workend.jpeg", "sea.png", "boo.png", "carrot.jpg", "nosleep.jpeg", "sleep.jpeg"]
    var textName = ["할 일 다 끝난 익명이", "항해 중인 익명이들", "할 일 많은 익명이", "당근을 흔드는 익명이", "잠들지 못하는 익명이", "벌써 자서 놀라는 익명이들"]
    var descript = ["자기 일을 다 끝내고 일이 남은 익명이들을 놀리지", "어디로 가는지는 모르겠어! 일단 가보자", "일이 많이 있지만 아무것도 하기 싫다", "여기서 날 구해줘!! 당근을 흔드는 익명이", "일찍 자는거 그게 뭔데!!!", "저기 봐! 벌써 잔대!! 세상에..."]

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var ikList: UIPickerView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLbl.text = "\(name) 익명이 안녕?"
        
        selectTitle = textName[0]
        selectImage = imageName[0]
        selectDesc = descript[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return textName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return textName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectTitle = textName[row]
        selectImage = imageName[row]
        selectDesc = descript[row]
    }
    
    @IBAction func btnView(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page3") as? Page3ViewController else {return}
                    //넘어갈 값을 지정
                    go.nameTitle = selectTitle
                    go.image = selectImage
                    go.desc = selectDesc
                    self.present(go, animated: true)
    }
    
}


