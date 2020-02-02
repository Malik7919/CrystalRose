//
//  MainCategoryCollectionViewCell.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/10/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import UIKit
import SDWebImage

class MainCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainCategoryImage: UIImageView!
    @IBOutlet weak var mainCategoryLabel: UILabel!
    var professionCellViewModel: ProfessionCellViewModel? {
        didSet {
            mainCategoryLabel.text = professionCellViewModel?.proff_name
            mainCategoryImage.sd_setImage(with: URL(string: "https://cpanels.shop/beauty/public/upload/\(professionCellViewModel?.proff_imageUrl ?? "" )") , completed: nil)
        }
    }
}
