//
//  ProfessionAPI.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/11/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ProfessionAPIProtocol {
    func getMainProfessions(completion:@escaping (_ response: Result<Bool> , _ mainProfessions: [ProfessionModel]?)->Void)
    func getSubProfessions(proff_id: Int, completion:@escaping (_ response: Result<Bool> , _ professionModel: [ProfessionModel]?)->Void)
}

class ProfessionAPI: ProfessionAPIProtocol{
    
    func getMainProfessions(completion:@escaping (_ response: Result<Bool> , _ mainProfessions: [ProfessionModel]?)->Void) {
        guard let url =  URL(string: APIServiceUrl.main + endPoint.GetMainProfessions.rawValue) else {
            completion(.failure(APIServiceError.invalidURL),nil)
            return}
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    print("ll")
                    completion(.failure(error),nil)
                case .success(let success):
                    let json = JSON(success)
                    let statusCode = response.response?.statusCode
                    switch statusCode {
                    case 200:
                        do {
                            let jsonData = try json["data"].rawData()
                            
                            let mainProfessions = try JSONDecoder()
                                .decode([FailableDecodable<ProfessionModel>].self, from: jsonData)
                                .compactMap { $0.base }
                            completion(.success(true),mainProfessions)
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                    default:
                        completion(.success(false),nil)
                    }
                }
        }
    }
    func getSubProfessions(proff_id: Int, completion:@escaping (_ response: Result<Bool> , _ professionModel: [ProfessionModel]?)->Void) {
        guard let url =  URL(string: APIServiceUrl.main + endPoint.GetSubProfessions.rawValue) else {
            completion(.failure(APIServiceError.invalidURL),nil)
            return}
        let parameters = ["proff_id": proff_id]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(error),nil)
                case .success(let success):
                    let json = JSON(success)
                    let statusCode = response.response?.statusCode
                    switch statusCode {
                    case 200:
                        do {
                            let jsonData = try json["data"].rawData()
                            let subProfessions = try JSONDecoder()
                                .decode([FailableDecodable<ProfessionModel>].self, from: jsonData)
                                .compactMap { $0.base }
                            print(subProfessions)
                            completion(.success(true),subProfessions)
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                    default:
                        completion(.success(false),nil)
                    }
                }
        }
    }
}
