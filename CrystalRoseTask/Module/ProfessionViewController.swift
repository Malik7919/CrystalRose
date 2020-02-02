//
//  ViewController.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/9/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfessionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainCategoryCollectionView: UICollectionView!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    lazy var viewModel: ProfessionViewModel = {
        return ProfessionViewModel()
    }()
    var subProfession: ProfessionCellViewModel?
    
    override func viewDidLoad() {
        initVM()
        viewModel.getMainProfessions()
    }
    
    func initVM() {
        
        viewModel.updateLoadingStatus = { [weak self] () in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                switch self.viewModel.state {
                case .empty, .error:
                    SVProgressHUD.dismiss()
                case .loading:
                    SVProgressHUD.show()
                case .populated:
                    self.mainCategoryCollectionView.isHidden = false
                    //    self.confirmButton.isHidden = false
                    SVProgressHUD.dismiss()
                }
                
            }
        }
        viewModel.reloadMainCollectionViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.mainCategoryCollectionView.reloadData()
            }
        }
        viewModel.reloadSubCollectionViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.subCategoryCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCategoryCollectionView {
            return viewModel.numberOfMainCells
        }
        return viewModel.numberOfSubCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCategoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCategoryCollectionViewCell else {
                fatalError("Failed to dequeueReusable MainCategoryCollectionViewCell")
            }
            let cellVM = viewModel.getMainCellViewModel( at: indexPath )
            cell.professionCellViewModel = cellVM
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCellidentifier", for: indexPath) as? SubCategoryCollectionViewCell else {
                fatalError("Failed to dequeueReusable SubCategoryCollectionViewCell")
            }
            cell.professionCellViewModel = viewModel.getSubCellViewModel( at: indexPath )
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCategoryCollectionView {
            let proff_id = viewModel.getMainCellViewModel( at: indexPath ).proff_id
            viewModel.getSubProfessions(proff_id: proff_id)
            subCategoryCollectionView.isHidden = false
            confirmButton.isHidden = false
            infoLabel.isHidden = true
        }
    }
}
extension ProfessionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCategoryCollectionView {
            return CGSize(width: collectionView.frame.width/2.5 , height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width - 32 , height: collectionView.frame.height/5.5)
        }
        
    }
}

