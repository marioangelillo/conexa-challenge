//
//  NewsTableViewCell.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 23/12/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var contentNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(news: NewsEntity) {
        self.imageNews.loadAndDisplayImage(from: news.image)
        self.titleNews.text = news.title
        self.contentNews.text = news.content
    }
    
}
