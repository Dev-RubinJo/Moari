//
//  CurationDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class CurationDataManager: CurationDataManagerDelegate {
    
    weak var actor: CurationActorDelegate?
    
    func loadCuration(toVC vc: CurationVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        
        Alamofire.request("\(Server.api)/curation", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: {(response: DataResponse<CurationResponse>) in
                switch response.result {
                case .success(let curationResponse):
                    switch curationResponse.code {
                    case 200:
                        self.actor?.removeAllCurationList()
                        for curation in curationResponse.result {
                            self.actor?.setCurationList(curation: curation)
                        }
                        vc.curationCollectionView.reloadData()
                    default:
                        break
                    }
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
}
