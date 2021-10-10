//
//  GitHubSearchTextField.swift
//  GitHubSearch
//
//  Created by zgagaSur on 07/10/2021.
//

import UIKit

class GitHubSearchTextField: UITextField {



    override init(frame: CGRect) {
        super.init(frame:frame)
        // configure trzeba odalic !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 10
        
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12

        backgroundColor = .none
        autocorrectionType = .no
        keyboardType = .default //rodzaj klaw w polu txt
        returnKeyType = .go

        placeholder = "Enter Item to Search For"
    }

}


