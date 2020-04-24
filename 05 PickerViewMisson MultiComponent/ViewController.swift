//
//  ViewController.swift
//  05 PickerViewMisson MultiComponent
//
//  Created by Gukhwa Jeon on 24.04.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                         "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    @IBOutlet var PickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< imageFileName.count {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[1]
        imageView.image = imageArray[1]
    }
    
    // 자동추가(UIPickerViewDataSource protocol)
    // 피커뷰에게 컴포넌트의 수를 정수 값으로 넘겨주는 델리게이트 메서드 (컬럼 갯수)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
       
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // 자동추가(UIPickerViewDataSource protocol)
    // numberOfRowsInComponent 인수를 가지는 델리게이트 메서드 (로우값)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
       
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            lblImageFileName.text = imageFileName[row]
        } else {
            imageView.image = imageArray[row]

        }
    }
}

