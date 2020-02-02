//
//  CheckBox.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/10/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    //images
    let checkedImage = UIImage(named: "checkbox")
    let unCheckedImage = UIImage(named: "uncheckbox")
    
    //bool propety
    @IBInspectable var isChecked:Bool = false{
        didSet{
            self.updateImage()
        }
    }

    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.buttonClicked), for: UIControl.Event.touchUpInside)
        self.updateImage()
    }
    
    
    func updateImage() {
        if isChecked == true{
            self.tintColor = UIColor.primary
            self.setImage(checkedImage, for: [])
        }else{
            self.tintColor = UIColor.black
            self.setImage(unCheckedImage, for: [])
        }

    }

    @objc func buttonClicked(sender:UIButton) {
        if(sender == self){
            isChecked = !isChecked
        }
    }

}
