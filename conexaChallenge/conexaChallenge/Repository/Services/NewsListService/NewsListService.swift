//
//  NewsListService.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 25/12/2023.
//

import Foundation
import Alamofire

class NewsListService {
    
    func call(onSuceess: @escaping([NewsListItemResponseDTO]) -> Void, onError: @escaping(String) -> Void) {
        
        let urlString = Repository.basicUrl + "/posts"
        let request = AF.request(urlString)
        
        request.responseData { response in
            print("Request: \(request)")
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([NewsListItemResponseDTO].self, from: data)
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
