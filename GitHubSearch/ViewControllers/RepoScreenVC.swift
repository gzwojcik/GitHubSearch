//
//  RepoScreenVC.swift
//  GitHubSearch
//
//  Created by zgagaSur on 06/10/2021.
//

import UIKit
import WebKit

class RepoScreenVC: UIViewController, WKUIDelegate {
    
    var webView:WKWebView!
    
    var longUrl:String!
    
    
    var urlToDisplay: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longUrl = urlToDisplay!
        
        NetworkManager.shared.fetchFoundRepo(longUrl: longUrl) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let foundRepo):
                
                DispatchQueue.main.async {
                    var myURL = URL(string: self.longUrl) // dummy String po poprawie
                    var myRequest = URLRequest(url: myURL!)
                    for item in foundRepo.items {
                        myURL = URL(string: item.html_url)// actual String from the Array
                        myRequest = URLRequest(url: myURL!)
                        SearchHistoryListVC.foundRepoList.append(foundRepo)
                    }
                    
                    // save to defaults
                    do {
                        // Create JSON Encoder
                        let encoder = JSONEncoder()
                        
                        // Encode Note
                        let data = try encoder.encode(SearchHistoryListVC.foundRepoList!)
                        
                        // Write/Set Data
                        UserDefaults.standard.set(data, forKey: "foundRepoList")
                        
                    } catch {
                        print("Unable to Encode Array of FoundRepos (\(error))")
                    }
                    
                    
                    self.webView.load(myRequest)
                    
                    
                }
                
            case .failure(let error):
                print("Something went wrong while fetching the FoundRepo")
            }
        }
        
    }
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        webView.uiDelegate = self
        view = webView
    }
    
    
    
}
