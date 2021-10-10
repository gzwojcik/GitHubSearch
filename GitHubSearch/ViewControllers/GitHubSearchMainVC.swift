//
//  GitHubSearchMainVC.swift
//  GitHubSearch
//
//  Created by zgagaSur on 07/10/2021.
//

import UIKit

class GitHubSearchMainVC: UIViewController, UITextFieldDelegate {

    let gitHubSearchTextField = GitHubSearchTextField()
   
    let callToActionButton = GitHubSearchButton(backgroundColor: .systemRed, title: "Start searching !")
    
    
    let containerView = UIView()
    
    let titleLabel = GitHubSearchLabel(textAlignment: .left, fontSize: 30, color: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
    
   
    let padding:CGFloat = 20

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
         
         configureContainerView()
         configureTitleLabel()
      
         configureTextField()
         
         configureCallToActionButton()
         createDismissKeyboardTapGesture()
     

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: true)
        //decided to leave it because of the back button
        
    }
    
    
    //Tap anywhere to dissmiss the keyb
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func configureTextField(){
        containerView.addSubview(gitHubSearchTextField)
        gitHubSearchTextField.delegate = self
        // must add the above to listen


        NSLayoutConstraint.activate([

            gitHubSearchTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            gitHubSearchTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            gitHubSearchTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -50),
            gitHubSearchTextField.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    
    func configureCallToActionButton(){
        containerView.addSubview(callToActionButton)

        callToActionButton.addTarget(self, action: #selector(pushRepoScreenVC), for: .touchUpInside)
        

        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            callToActionButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            callToActionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -120),
            callToActionButton.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
    
    func configureTitleLabel(){
        //adding to the subview
        view.addSubview(titleLabel)
        // nil coalescing, unwrap an optional
        titleLabel.text =  "Search Git Hub"

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor,constant:-120),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.widthAnchor.constraint(equalTo:containerView.widthAnchor)
            //titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])

    }

    

    
    func configureContainerView() {
        view.addSubview(containerView)
        
       
        containerView.backgroundColor = .systemBlue
        containerView.layer.cornerRadius = 8
        
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 160),
            containerView.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor,constant: -30)

        ])
    }
    
    @objc func pushRepoScreenVC() {
        
        
        let repoScreenVC      = RepoScreenVC()
        
        repoScreenVC.urlToDisplay = "https://api.github.com/search/repositories?q=" + gitHubSearchTextField.text!
       
        navigationController?.pushViewController(repoScreenVC, animated: true)
        
    }
    
    
    
}

@available(iOS 13.0, *)
extension GitHubSearchMainVC {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushRepoScreenVC()
        return true
    }
}



    

    


