//
//  UIViewController+Ext.swift
//  GitHubSearch
//
//  Created by zgagaSur on 07/10/2021.
//


import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController {
    
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .black
        present(safariVC, animated: true)
    }
    
    
}
