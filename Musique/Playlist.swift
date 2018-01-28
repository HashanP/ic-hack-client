//
//  Playlist.swift
//  Musique
//
//  Created by Hashan Punchihewa on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import Foundation
import Alamofire

class Playlist: Equatable, Hashable {
    var name: String
    var url: URL
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    func toParameters() -> Parameters {
        return [
            "name": name,
            "url": url
        ]
    }
    
    func toParameters(tracks: [Track]) -> Parameters {
        var k: [Parameters] = []
        for t in tracks {
            k.append(t.toParameters())
        }
        return [
            "name": name,
            "url": url.absoluteString,
            "tracks": k
        ]
    }
    
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name &&
            lhs.url == rhs.url
    }

    var hashValue: Int {
        return name.hashValue ^ url.hashValue
    }
}
