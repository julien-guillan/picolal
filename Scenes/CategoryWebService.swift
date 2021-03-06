//
//  CategoryWebService.swift
//  partyRules
//
//  Created by Julien Guillan on 06/02/2020.
//  Copyright © 2020 Julien Guillan. All rights reserved.
//

import Foundation

class CategoryWebService {
    func getCategory(id: Int, completion: @escaping ([Category]) -> Void) -> Void {
        guard let categoryURL = URL(string: "http://lil-nas.ddns.net:8080/api/category/" + String(id)) else {
            return;
        }
        let task = URLSession.shared.dataTask(with: categoryURL, completionHandler: { (data: Data?, res, err) in
        
            guard let bytes = data,
                  err == nil,
                  let json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [Any] else {
                    DispatchQueue.main.sync {
                        completion([])
                    }
                return
            }
            let category = json.compactMap { (obj) -> Category? in
                guard let dict = obj as? [String: Any] else {
                    return nil
                }
                return CategoryFactory.categoryFrom(dictionnary: dict)
            }
            DispatchQueue.main.sync {
                completion(category)
            }
        })
        task.resume()
    }
    
    func getAllCategories(completion: @escaping ([Category]) -> Void) -> Void {
        guard let categoriesURL = URL(string: "http://lil-nas.ddns.net:8080/api/categories") else {
            return;
        }
        let task = URLSession.shared.dataTask(with: categoriesURL, completionHandler: { (data: Data?, res, err) in
            print(data)
            guard let bytes = data,
                  err == nil,
                  let json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [Any] else {
                    DispatchQueue.main.sync {
                        completion([])
                    }
                return
            }
            let categories = json.compactMap { (obj) -> Category? in
                guard let dict = obj as? [String: Any] else {
                    return nil
                }
                return CategoryFactory.categoryFrom(dictionnary: dict)
            }
            DispatchQueue.main.sync {
                completion(categories)
            }
        })
        task.resume()
    }
}
