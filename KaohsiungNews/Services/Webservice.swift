//
//  Webservice.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    print(articleList.articles)
                    completion(articleList.articles)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
