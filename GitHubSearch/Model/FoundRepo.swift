//
//  FoundRepo.swift
//  GitHubSearch
//
//  Created by zgagaSur on 06/10/2021.
//

import UIKit

struct FoundRepo: Codable{
    
    var items: [Items]

}

struct Items: Codable {
    var id: Int
    var name: String
    // name of the search phrase/item
    var full_name: String
    
    var url:String
    // direct url to the repository with its name to the api
    var created_at:String
    var visibility: String
    //"public"
    
    var html_url:String
    //direct addres to the repo
    

}
