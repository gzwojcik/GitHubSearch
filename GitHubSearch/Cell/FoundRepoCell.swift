//
//  FoundRepoCell.swift
//  GitHubSearch
//
//  Created by zgagaSur on 06/10/2021.
//

import UIKit


class FoundRepoCell: UITableViewCell {

    static let reuseID = "FoundRepoCell"
    

    
    var foundRepoCellNameLabel = GitHubSearchLabel(textAlignment: .left, fontSize: 16, color:UIColor (red: 0, green: 0, blue: 0, alpha: 1))
    
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (searchHistoryItem:FoundRepo){
        foundRepoCellNameLabel.text = "Found Repos:\(searchHistoryItem.items[GitVariables.cellNumber].full_name)"
        
        
        
        // jak nie dam rady to ustawic "znaleziona rzecz" na sztywno
    }
    
    func setCellName (cellName:String){
        foundRepoCellNameLabel.text = "Found Repos:\(cellName)"
        
        
        
        // jak nie dam rady to ustawic "znaleziona rzecz" na sztywno
    }
    
    private func configure(){
        addSubview(foundRepoCellNameLabel)
        
        accessoryType   = .disclosureIndicator
        let padding:CGFloat  = 10
        
        NSLayoutConstraint.activate([
            foundRepoCellNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            foundRepoCellNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            foundRepoCellNameLabel.heightAnchor.constraint(equalToConstant: 100),
            foundRepoCellNameLabel.widthAnchor.constraint(equalToConstant: 500)
        ])
        
    }
    


}
