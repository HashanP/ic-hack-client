//
//  CheckResponse.swift
//  Musique
//
//  Created by Julie Emile on 27/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import ObjectMapper

class CheckResponse: Mappable {
    var response: Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        response <- map["response"]
    }
}
