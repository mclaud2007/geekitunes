//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 20.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongDetailView: UIView {
    
    private(set) lazy var artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        
        return imageView
    }()

    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        return label
    }()
    
    private(set) lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setpLayout()
    }
    
    private func setpLayout(){
        self.addSubview(self.artworkImageView)
        self.addSubview(self.trackNameLabel)
        self.addSubview(self.artistNameLabel)
        self.addSubview(self.collectionNameLabel)
        self.addSubview(self.releaseDateLabel)
        
        NSLayoutConstraint.activate([
            self.artworkImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.artworkImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            self.artworkImageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.artworkImageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            self.trackNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.artworkImageView.leftAnchor, constant: -10.0),
            
            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 12.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.trackNameLabel.leftAnchor),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.artworkImageView.rightAnchor, constant: -16.0),
            
            self.releaseDateLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 12.0),
            self.releaseDateLabel.leftAnchor.constraint(equalTo: self.artistNameLabel.leftAnchor),
            self.releaseDateLabel.rightAnchor.constraint(equalTo: self.artistNameLabel.rightAnchor),
            
            self.collectionNameLabel.topAnchor.constraint(equalTo: self.artworkImageView.bottomAnchor, constant: 16.0),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            self.collectionNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            self.collectionNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
