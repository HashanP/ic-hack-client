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
    
    static func upload(username: String, playlists: [Parameters] , f: @escaping ((Bool) -> ())) {
        let tv: Parameters = [
            "id": username,
            "playlists": playlists
        ]
        Alamofire.request(SERVER + "/upload", method: .post, parameters: tv, encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
    
    static func createGroup(group: String,  f: @escaping ((Bool) -> ())) {
        Alamofire.request(SERVER + "/create", method: .post, /*parameters: tv,*/ encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
    
    static func joinGroup(group: String,  f: @escaping ((Bool) -> ())) {
        Alamofire.request(SERVER + "/join", method: .post, /*parameters: tv,*/ encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
    
    static func deleteGroup(group: String,  f: @escaping ((Bool) -> ())) {
        Alamofire.request(SERVER + "/delete", method: .post, /*parameters: tv,*/ encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
    
    static func getNextSong(group: String,  f: @escaping ((Bool) -> ())) {
        Alamofire.request(SERVER + "/getNextSong", method: .post, /*parameters: tv,*/ encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
    
    static func getMembers(group: String,  f: @escaping ((Bool) -> ())) {
        Alamofire.request(SERVER + "/getNextSong", method: .post, /*parameters: tv,*/ encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
    
    static func convert(d: [Playlist:[Track]]) -> [Parameters] {
        var t: [Parameters] = []
        for (d1, t1) in d {
            t.append(d1.toParameters(tracks: t1))
        }
        return t
    }
}
