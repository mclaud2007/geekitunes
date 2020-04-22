//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
    
    public var trackName: String
    public var artistName: String?
    public var collectionName: String?
    public var artwork: String?
    public var price: Double?
    public var releaseDate: Date?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artwork = "artworkUrl100"
        case price = "trackPrice"
        case releaseDate = "releaseDate"
    }
    
    // MARK: - Init
    
    internal init(trackName: String,
                  artistName: String?,
                  collectionName: String?,
                  artwork: String?,
                  price: Double?,
                  release: Date?) {
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.artwork = artwork
        self.price = price
        self.releaseDate = release
    }
}
