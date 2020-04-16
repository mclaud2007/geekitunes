//
//  AppDetailDescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 09.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDescriptionView: UIView {
    private(set) lazy var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.numberOfLines = 5
        
        return label
    }()
    
    private(set) lazy var appMoreDescriptionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Еще", for: .normal)
        button.addTarget(self, action: #selector(self.moreButtonClicked(sender:)), for: .touchUpInside)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    @objc func moreButtonClicked(sender: UIButton) {
        if self.appDescriptionLabel.numberOfLines == 5 {
            self.appDescriptionLabel.numberOfLines = .max
            self.appMoreDescriptionButton.setTitle("Меньше", for: .normal)
        } else {
            self.appDescriptionLabel.numberOfLines = 5
            self.appMoreDescriptionButton.setTitle("Еще", for: .normal)
        }
    }

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
        self.addSubview(self.appMoreDescriptionButton)
        
        NSLayoutConstraint.activate([
            self.appDescriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            self.appDescriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.appDescriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
            self.bottomAnchor.constraint(equalTo: self.appMoreDescriptionButton.bottomAnchor, constant: 12),
            
            self.appMoreDescriptionButton.topAnchor.constraint(equalTo: self.appDescriptionLabel.bottomAnchor, constant: 5.0),
            self.appMoreDescriptionButton.rightAnchor.constraint(equalTo: self.appDescriptionLabel.rightAnchor),
            self.appMoreDescriptionButton.widthAnchor.constraint(equalToConstant: 80.0),
            self.appMoreDescriptionButton.heightAnchor.constraint(equalToConstant: 20.0)
        ])
    }
}
