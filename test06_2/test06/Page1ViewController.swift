//
//  Page1ViewController.swift
//  test06
//
//  Created by apple on 2021/11/03.
//

import UIKit

class Page1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!

    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT : CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                         "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<MAX_ARRAY_NUM {
            //UIImage image = new UIImage(imageFileName[0]);
            //ImageIcon icon = new ImageIcon("a.jpg");
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    
    //피커뷰를 몇 개 넣을것인지 결정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //전체 피커뷰에 넣을 개수를 지정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //피커뷰의 높이를 결정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //피커뷰에 무엇을 넣을지를 결정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let imageObject = UIImageView(image: imageArray[row])
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
//        return imageObject
//    }
    
    
    //피커뷰에서 하나를 선택후 어떤 처리를 할지를 결정
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //파일 이름 설정
        lblImageFileName.text = imageFileName[row]
        //이미지뷰에 이미지 끼워주세요.
        imageView.image = imageArray[row]
    }
}
