//
//  CubeService.swift
//  CubeStore
//
//  Created by Ravil on 12.09.2023.
//

import Foundation

class CubeService {
    static func fetchOffers(completion: @escaping ([CubeOffer]?, Error?) -> Void) {
        let apiUrl = "http://localhost:5000/Cube/GetAllPromocodes"
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil, NSError(domain: "InvalidURL", code: -1, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching hotel data: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil, NSError(domain: "NoData", code: -1, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let offerData = try decoder.decode([CubeOffer].self, from: data)
                completion(offerData, nil)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
