//
//  Article.swift
//  MVVM
//
//  Created by 오국원 on 2021/12/27.
//

import Foundation

struct ArticleList: Decodable{
    let articles: [Article]
}

struct Article: Decodable { //JSON을 model로 decode하기 위해 사용 codable도 사용가능 but sending back 안하기 때문에 decodable사용
    let title: String
    let description: String
}
