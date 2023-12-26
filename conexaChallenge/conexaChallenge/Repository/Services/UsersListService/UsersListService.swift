//
//  UsersListService.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 25/12/2023.
//

import Foundation
import Alamofire

class UsersListService {
    
    func call(onSuceess: @escaping([UsersListItemResponseDTO]) -> Void, onError: @escaping(String) -> Void) {
        
        let urlString = Repository.basicUrl + "/users"
        let request = AF.request(urlString)
        
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([UsersListItemResponseDTO].self, from: data)
                    print(jsonData)
                    onSuceess(jsonData)
                } catch {
                    onError("error decoding")
                }
            case .failure(let error):
                onError(error.localizedDescription)
            }
        }
    }
}
