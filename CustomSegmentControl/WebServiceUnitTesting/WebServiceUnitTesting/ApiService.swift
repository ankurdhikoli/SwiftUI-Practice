//
//  ApiService.swift
//  WebServiceUnitTesting
//
//  Created by Ankur Chauhan on 8/1/21.
//

import Foundation


class ApiService {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getDataFromUrl(url: URL, completion: ((HTTPURLResponse?, Error?) -> Void)? = nil) {
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error.debugDescription)
                completion?(nil, error )
            }
            if let res = response as? HTTPURLResponse {
                print(res.statusCode)
                completion?(res, nil )
            }
        }.resume()
    }
}

