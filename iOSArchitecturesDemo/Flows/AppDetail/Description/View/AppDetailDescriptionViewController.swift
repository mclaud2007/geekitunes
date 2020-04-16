//
//  AppDetailDescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 09.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionView: UIView {
    private(set) lazy var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 5
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.addSubview(self.appDescriptionLabel)
        
        NSLayoutConstraint.activate([
            self.appDescriptionLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.appDescriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.appDescriptionLabel.widthAnchor.constraint(equalToConstant: 120.0),
            self.appDescriptionLabel.heightAnchor.constraint(equalToConstant: 120.0)
            
        ])
    }
}
