//
//  WebService.swift
//  MVVM
//
//  Created by 오국원 on 2021/12/27.
//

//get article or news
import Foundation

class WebService {
    //URL = URL of the top headlines get URL from NEW API
    //Article(model)을 못찾을 수도 있으니 Article을 옵셔널로
    //특정 url에서 우리가 data를 가져 올 수 있나를 확인하는 과정임
    func getArticle(url: URL, completion: @escaping ([Article]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            //if the data exists, if there is no error, then we can do something
            //클로저 고급
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {//data를 캐스팅해야함
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                // News API JSON에서 article은 root가 아니라 nest되어 있어서 nil값을 반환하는 상황
                if let articleList = articleList{
                    completion(articleList.articles)
                }
                print(articleList?.articles)
                
            }
        }.resume() //중요
    }
}
