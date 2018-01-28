//
//  Important.swift
//  Musique
//
//  Created by Hashan Punchihewa on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import Foundation

class Important {
    static func getPlaylistNames(f: @escaping (([Playlist]) -> ())) -> () {
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let session = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            let accessToken = session.accessToken
            let user = session.canonicalUsername
            do {
                let k = try SPTPlaylistList.createRequestForGettingPlaylists(forUser: user, withAccessToken: accessToken)
                let handler = SPTRequest.sharedHandler()
                func f2(error: Optional<Error>, resp: Optional<URLResponse>, data: Optional<Data>) {
                    var v: [Playlist] = []
                    do {
                        let t = try SPTPlaylistList.init(from: data, with: resp)
                        for i in t.items {
                            let i2 = i as! SPTPartialPlaylist
                            print(i2.name)
                            if (i2.playableUri != nil) {
                                v.append(Playlist(name: i2.name, url: i2.playableUri!))
                            }
                        }
                        f(v)
                    } catch {
                        
                    }
                }
                handler?.perform(k, callback: f2)
            } catch {
                
            }
        }
    }
    
    static func fix(all: [Playlist], f3: @escaping (([Playlist:[Track]]) -> ())) {
            var d: [Playlist:[Track]] = [:]
            var current = 0
            for a in all {
                func t(z: [Track]) {
                    print("day3")
                    d[a] = z
                    current += 1
                    if current == all.count {
                        f3(d)
                    }
                }
                getPlaylist2(k:a, f:t)
            }
        }
    
    static func getPlaylist2(k: Playlist, f: @escaping (([Track]) -> ())) {
        getPlaylist(k: k.url, f: f)
    }
   
    
    static func getPlaylist(k: URL, f: @escaping (([Track]) -> ())) {
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let session = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            let accessToken = session.accessToken
            let user = session.canonicalUsername
            do {
                let k = try SPTPlaylistSnapshot.createRequestForPlaylist(withURI: k, accessToken: session.accessToken)
                let handler = SPTRequest.sharedHandler()
                func f2(error: Optional<Error>, resp: Optional<URLResponse>, data: Optional<Data>) {
                    var v: [Track] = []
                    do {
                        let t = try SPTPlaylistSnapshot.init(from: data, with: resp)
                        let t3 = t.firstTrackPage
                        
                        for i in t3!.items {
                            let i5 = i as! SPTPlaylistTrack
                            v.append(Track(name: i5.name, url: i5.uri, identifier: i5.identifier, popularity: i5.popularity))
                        }
                        f(v)
                    } catch {
                        
                    }
                }
                handler?.perform(k, callback: f2)
            } catch {
                
            }
        }
    }
    
    static func getUsername() -> String {
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let session = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            return session.canonicalUsername
        } else {
            return "";
        }
    }
}
