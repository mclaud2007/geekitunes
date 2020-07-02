//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 20.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderViewController: UIViewController {
    
    private let song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailHeaderView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    init(song: ITunesSong){
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    private func fillData(){
        self.downloadImage()
        self.songDetailHeaderView.trackNameLabel.text = song.trackName
        self.songDetailHeaderView.artistNameLabel.text = song.artistName ?? "Unknown"
        self.songDetailHeaderView.collectionNameLabel.text = song.collectionName ?? "n/a"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        
        if let release = song.releaseDate {
            self.songDetailHeaderView.releaseDateLabel.text = dateFormatter.string(from: release)
        }
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songDetailHeaderView.artworkImageView.image = image
        }
    }
}
