//
//  ItemListViewModel.swift
//  NYTimes
//
//  Created by Chandan Singh on 26/01/20.
//  Copyright © 2019 @Personal. All rights reserved.
//

import Foundation


class ItemListViewModel {
    
    func handleGetPopulatItemList(completionHandler: @escaping (Result<[ItemInfo], Error>) -> Void) {
        let Url = kBaseAPI+kSampleKey
        let url = URL(string: Url)
        
        let session = URLSession.shared
        if let usableUrl = url {
            let task = session.dataTask(with: usableUrl, completionHandler: { (data, response, error) in
                if let data = data {
                    
                    do {
                        //here dataResponse received from a network request
                        let decoder = JSONDecoder()
                        let abc = try decoder.decode(ItemInfoList.self, from:
                            data) //Decode JSON Response Data
                        print(abc)
                        completionHandler(.success(abc.results))
                    } catch let parsingError {
                        print("Error", parsingError)
                        completionHandler(.failure(error!))
                    }
                }
                else {
                    completionHandler(.failure(error!))
                }
            })
            task.resume()
        }
        
        
    }

}
