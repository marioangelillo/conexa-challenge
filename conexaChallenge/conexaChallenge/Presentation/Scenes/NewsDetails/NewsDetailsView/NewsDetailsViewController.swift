//
//  NewsDetailsViewController.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class NewsDetailsViewController: UIViewController, NewsDetailsViewControllerProtocol {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var newsCategory: UILabel!
    @IBOutlet weak var newsPublicationDate: UILabel!
    
    var presenter: NewsDetailsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter else { return }

        self.newsImage.loadAndDisplayImage(from: presenter.getImageUrl())
        self.newsTitle.text = presenter.getTitle()
        self.newsContent.text = presenter.getContent()
        self.newsCategory.text = presenter.getCategory()
        self.newsPublicationDate.text = presenter.getPublicationDate()
        
    }

}
