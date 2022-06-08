//
//  WebService.swift
//  CryptoCrazy-MVVM
//
//  Created by macbook on 8.06.2022.
//

import Foundation


class Webservice {
    
    func dowloadCurrency(url: URL, completion: @escaping ([CryptoModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                
                let crytpoList = try? JSONDecoder().decode([CryptoModel].self, from: data)
                print(crytpoList)
                
                if let cryptoList = crytpoList {
                    completion(crytpoList)
                }
                
            }
            
        }.resume()
        
    }
    
}
