//
//  Track.swift
//  Musique
//
//  Created by Hashan Punchihewa on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import Foundation
import Alamofire

class Track {
    var url: URL
    var name: String
    var identifier: String
    var popularity: Double
    
    init(name: String, url: URL, identifier: String, popularity: Double) {
        self.name = name
        self.url = url
        self.identifier = identifier
        self.popularity = popularity
    }
    
    func toParameters() -> Parameters {
        return [
            "name": name,
            "url": url.absoluteString,
            "identifier": identifier,
            "popularity": popularity
        ]
    }
}
