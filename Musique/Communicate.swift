//
//  Communicate.swift
//  Musique
//
//  Created by Julie Emile on 27/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Communicate {
    static var SERVER = "http://165.227.227.18:3000"
    //static var SERVER = "https://httpbin.org/post"
    static func isLoggedIn(username : String, f: @escaping ((Bool) -> ())) {
        let tv = ["id": username]
        Alamofire.request(SERVER + "/check", method: .post, parameters: tv, encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            print(response)
            let k = response.result.value?.response
            if let k2 = k {
                print("bonjour2")
                f(k2)
             }
        }
    }
}
