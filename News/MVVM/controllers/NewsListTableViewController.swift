//
//  NewsListTableViewController.swift
//  MVVM
//
//  Created by 오국원 on 2021/12/27.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController{
    
    private var articleListVM: ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&apiKey=75d8386d9e654c5982195a0a6a3c3859")!
        
        WebService().getArticle(url: url) { articles in
            
            if let articles = articles{
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                //refresh table view
                DispatchQueue.main.async{//make sure reloaded on the main thread on the UI thread 먼저 실행되지 않게 비동기로
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections//articleListVM이 꼭 nil이 아니여야함
  
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}
