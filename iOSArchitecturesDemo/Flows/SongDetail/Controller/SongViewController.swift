//
//  SongViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 20.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {
    
    public var song: ITunesSong
    
    lazy var headerViewController = SongDetailHeaderViewController(song: song)
    
    init(song: ITunesSong){
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationController()
        self.addHeaderViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(self.headerViewController)
        self.view.addSubview(self.headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        
        self.headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }

    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
    }

}
