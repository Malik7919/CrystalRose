//
//  ProfessionViewModel.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/11/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import Alamofire

class ProfessionViewModel {
    private var professionAPI: ProfessionAPIProtocol
    private var professions: [ProfessionModel] = [ProfessionModel]()
    
    private var mainCellViewModels: [ProfessionCellViewModel] = [ProfessionCellViewModel]() {
        didSet {
            self.reloadMainCollectionViewClosure?()
        }
    }
    private var subCellViewModels: [ProfessionCellViewModel] = [ProfessionCellViewModel]() {
        didSet {
            self.reloadSubCollectionViewClosure?()
        }
    }
    
    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var numberOfMainCells: Int {
        return mainCellViewModels.count
    }
    
    var numberOfSubCells: Int {
        return subCellViewModels.count
    }
    
    var reloadMainCollectionViewClosure: (()->())?
    var reloadSubCollectionViewClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    init(professionAPI: ProfessionAPIProtocol = ProfessionAPI()) {
        self.professionAPI = professionAPI
    }
    
    func getMainProfessions() {
        
        state = .loading
        professionAPI.getMainProfessions(completion: { [weak self]  result, response in
            guard let self = self else {
                return
            }
            guard let response = response else {
                self.state = .error
                return
            }
            self.processMainProfessions(result: result, response: response)
        })
    }
    func getSubProfessions(proff_id: Int) {
         
         state = .loading
        professionAPI.getSubProfessions(proff_id: proff_id, completion: { [weak self]  result, response in
             guard let self = self else {
                 return
             }
             guard let response = response else {
                 self.state = .error
                 return
             }
             self.processSubProfessions(result: result, response: response)
         })
     }
    
    func getMainCellViewModel( at indexPath: IndexPath ) -> ProfessionCellViewModel {
        return mainCellViewModels[indexPath.row]
    }
    
    func getSubCellViewModel( at indexPath: IndexPath ) -> ProfessionCellViewModel {
        return subCellViewModels[indexPath.row]
    }
    
    func createCellViewModel( profession: ProfessionModel ) -> ProfessionCellViewModel {
        
        return ProfessionCellViewModel(proff_id: profession.proff_id!, proff_name: profession.name!, proff_imageUrl: profession.proff_img!)
    }
    private func processMainProfessions(result: Result<Bool>, response: [ProfessionModel]) {
        switch result {
        case .success(let result):
            print(result)
            switch result {
            case true:
                state = .populated
                self.professions = response
                var vms = [ProfessionCellViewModel]()
                for profession in professions {
                    vms.append(createCellViewModel(profession: profession))
                }
                self.mainCellViewModels = vms
            case false:
                self.state = .error
            }
        case .failure(let error):
            self.state = .error
            print(error.localizedDescription)
        }
    }
   private func processSubProfessions(result: Result<Bool>, response: [ProfessionModel]) {
        switch result {
        case .success(let result):
            print(result)
            switch result {
            case true:
                state = .populated
                self.professions = response
                print(response)
                var vms = [ProfessionCellViewModel]()
                for profession in professions {
                    vms.append(createCellViewModel(profession: profession))
                }
                self.subCellViewModels = vms
            case false:
                self.state = .error
            }
        case .failure(let error):
            self.state = .error
            print(error.localizedDescription)
        }
    }
}
