//
//  SubCategoryCollectionViewCell.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/10/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var subCategoryLabel: UILabel!
  @IBOutlet weak var subCategoryImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addBorder(color: UIColor.lightGray, borderWidth: 0.8)
       
    }
    var professionCellViewModel: ProfessionCellViewModel? {
           didSet {
               subCategoryLabel.text = professionCellViewModel?.proff_name
               subCategoryImage.sd_setImage(with: URL(string: "https://cpanels.shop/beauty/public/upload/\(professionCellViewModel?.proff_imageUrl ?? "" )") , completed: nil)
           }
       }
    
}
