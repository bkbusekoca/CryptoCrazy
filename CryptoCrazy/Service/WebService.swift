//
//  WebService.swift
//  CryptoCrazy
//
//  Created by buse koca on 11.06.2023.
//

import Foundation
class WebService {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        //cryptocurrenty dızısını escaping ettık
        URLSession.shared.dataTask(with: url){(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
             let cryptoList = try?  JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
                        
    }.resume()
    
    }
    }
