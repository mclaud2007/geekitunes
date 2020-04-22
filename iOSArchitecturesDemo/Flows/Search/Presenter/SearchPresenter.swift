//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Elena Gracheva on 26.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: class {
    
    var appsSearchResults: [ITunesApp] { get set }
    
    var songsSearcgResult: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SearchViewOutput: class {
    
    func viewDidSearch(with query: String, for type: ITunesSearch.meadiType)
    
    func viewDidSelectApp(_ app: ITunesApp)
    
    func viewDidSelectSong(_ song: ITunesSong)
}

class SearchPresenter {
    
    private let searchService = ITunesSearchService()
    
    var viewInput: (UIViewController & SearchViewInput)?
    
    let interactor: SearchInteractorInput
    let router: SearchRouterInput
    
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String, for type: ITunesSearch.meadiType) {
        if type == .app {
            self.interactor.requestApps(with: query) { [weak self]  results in
                guard let self = self else { return }
                self.viewInput?.throbber(show: false)
                results
                    .withValue { apps in
                        guard !apps.isEmpty else {
                            self.viewInput?.showNoResults()
                            return
                        }
                        self.viewInput?.hideNoResults()
                        self.viewInput?.appsSearchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
                
            }
        } else {
            self.interactor.requestSongs(with: query) { [weak self]  results in
                guard let self = self else { return }
                self.viewInput?.throbber(show: false)
                results
                    .withValue { songs in
                        guard !songs.isEmpty else {
                            self.viewInput?.showNoResults()
                            return
                        }
                        self.viewInput?.hideNoResults()
                        self.viewInput?.songsSearcgResult = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
            }
        }
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openAppDetails(with: app)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openSongDetail(with: song)
    }
    
    
}
