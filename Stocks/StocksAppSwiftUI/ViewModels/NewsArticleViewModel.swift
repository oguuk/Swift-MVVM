//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Created by 오국원 on 2022/01/08.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String{
        return self.article.imageURL
    }
    
    var title: String{
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
