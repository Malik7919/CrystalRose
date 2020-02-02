//
//  UIColor.swift
//  LoginTask
//
//  Created by Jets39 on 7/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    static var background: UIColor {
      return UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
    }
    static var primary: UIColor {
      return UIColor(red: 179 / 255, green: 152 / 255, blue: 63 / 255, alpha: 1)
    }
    static var secondary: UIColor {
      return UIColor(red: 0 / 255, green: 116 / 255, blue: 189 / 255, alpha: 1)
    }
    static var shapeColor: UIColor {
      return UIColor(red: 215 / 255, green: 215 / 255, blue: 215 / 255, alpha: 1)
    }
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image(actions: { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        })
    }
}

