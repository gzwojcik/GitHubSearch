//
//  GitHubSearchButton.swift
//  GitHubSearch
//
//  Created by zgagaSur on 07/10/2021.
//

import UIKit

class GitHubSearchButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(backgroundColor:UIColor, title:String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()

    }


    private func configure (){
        layer.cornerRadius = 15
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}


