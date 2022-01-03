//
//  ArticleViewModel.swift
//  MVVM
//
//  Created by 오국원 on 2021/12/27.
//
//this AVM is the view model that is going to provide some sort of information, some sort of data to the user interface.
import Foundation

struct ArticleListViewModel {//부모model
    //부모model을 추가하면 좋은 점: 모든 뷰를 나타내준다.
    let articles: [Article]
}

extension ArticleListViewModel{//provide number of section, roads fuction
    var numberOfSections: Int {
        return 1
    }
    func numberOfRowInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ Index: Int) -> ArticleViewModel {
        //particular index의 ArticleViewModel을 반환
        let article = self.articles[Index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel { //responsible for displaying one particular news article
    private let article: Article
    
}

extension ArticleViewModel {//initialize용
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {//something very different extension
    var title: String{
        return self.article.title
    }
    
    var description: String{
        return self.article.description
    }
}
