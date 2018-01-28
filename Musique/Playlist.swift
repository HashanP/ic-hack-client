//
//  Playlist.swift
//  Musique
//
//  Created by Hashan Punchihewa on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import Foundation

class Playlist {
    var name: String
    var url: URL
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
}
