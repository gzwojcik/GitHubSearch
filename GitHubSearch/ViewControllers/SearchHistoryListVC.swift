//
//  SearchHistoryListVC.swift
//  GitHubSearch
//
//  Created by zgagaSur on 06/10/2021.
//

import UIKit

class SearchHistoryListVC: UIViewController {
    
    static var foundRepoList: [FoundRepo]! = []
    
    let tableView               = UITableView()
    
  

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
         configureTableView()
        
         self.tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
       
        loadUserDefaults()
        // load USER DEFAULTS!!!!!
      }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(FoundRepoCell.self, forCellReuseIdentifier: FoundRepoCell.reuseID)
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBlue
        title                = "Search History"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
     

  }

    func loadUserDefaults(){
        // load user Defaults
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "foundRepoList") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // Decode Repo
                let reposOptional: [FoundRepo]? = try decoder.decode([FoundRepo].self, from: data)
                if let repos = reposOptional {
                    SearchHistoryListVC.foundRepoList = repos
                    //print(HistoryListVC.tinyUrlList2)
                }
            } catch {
                print("Unable to Decode SearchHistoryList (\(error))")
            }
        }
    }
    
}



extension SearchHistoryListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return SearchHistoryListVC.foundRepoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoundRepoCell.reuseID) as! FoundRepoCell
        let foundRepoItem = SearchHistoryListVC.foundRepoList[indexPath.row]
        
        cell.set(searchHistoryItem: foundRepoItem)
        GitVariables.cellNumber = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foundRepoItem = SearchHistoryListVC.foundRepoList[indexPath.row]
        
        presentSafariVC(with: URL(string: foundRepoItem.items[indexPath.row].html_url)!)
    }
    

  
}
