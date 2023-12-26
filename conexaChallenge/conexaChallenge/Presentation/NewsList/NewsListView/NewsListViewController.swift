//
//  NewsListViewController.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 22/12/2023.
//

import UIKit

class NewsListViewController: BaseViewController, NewsListViewControllerProtocol {
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var presenter: NewsListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        newsTableView.reloadData()
    }
    
    @IBAction func didTapSearchButton(_ sender: Any) {
        guard let searchText = searchTextField.text?.lowercased(), !searchText.isEmpty else {
            presenter?.setAllNews()
            return
        }
        presenter?.didTapSearchButton(searchText: searchText)
    }
    
    func reloadTableView() {
        newsTableView.reloadData()
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNumberOfNews() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell, let presenter = presenter else { return UITableViewCell() }
        
        cell.setData(news: presenter.getNewsItem(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigationController = self.navigationController else { return }
        presenter?.didTapCell(nc: navigationController, index: indexPath.row)
    }
    
}
