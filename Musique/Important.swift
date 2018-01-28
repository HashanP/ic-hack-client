//
//  Important.swift
//  Musique
//
//  Created by Hashan Punchihewa on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import Foundation

class Important {
    static func getPlaylistNames(f: @escaping (([URL]) -> ())) -> () {
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
                    var v: [URL] = []
                    do {
                        let t = try SPTPlaylistList.init(from: data, with: resp)
                        for i in t.items {
                            let i2 = i as! SPTPartialPlaylist
                            print(i2.name)
                            if (i2.playableUri != nil) {
                                v.append(i2.playableUri!)
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
    
    static func getPlaylist(k: URL, f: (([String]) -> ())) {
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
                    var v: [String] = []
                    do {
                        let t = try SPTPlaylistSnapshot.init(from: data, with: resp)
                        let t3 = t.firstTrackPage
                       
                        for i in t3!.items {
                            print(i)
                        }
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
