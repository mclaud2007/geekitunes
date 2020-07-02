//
//  SearchRouterInput.swift
//  iOSArchitecturesDemo
//
//  Created by Григорий Мартюшин on 22.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchRouterInput {
    func openAppDetails(with app: ITunesApp)
    
    func openSongDetail(with song: ITunesSong)
}

final class SearchRouter: SearchRouterInput {
    weak var viewController: UIViewController?
    
    func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
    func openSongDetail(with song: ITunesSong) {
        let songDetailViewController = SongViewController(song: song)
        self.viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}
