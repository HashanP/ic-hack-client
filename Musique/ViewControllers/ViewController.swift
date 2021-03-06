//
//  ViewController.swift
//  Musique
//
//  Created by Julie Emile on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SPTAudioStreamingPlaybackDelegate, SPTAudioStreamingDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin), name: Notification.Name("loginSuccessfull"), object: nil)
    }
    
    func setup() {
        SPTAuth.defaultInstance().clientID = "58ee327cbca3400b99fbb672b4b97393"
        SPTAuth.defaultInstance().redirectURL = URL(string: "my-awesome-app-login://callback")
        SPTAuth.defaultInstance().requestedScopes = [
            SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope,
            SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistModifyPrivateScope]
        loginUrl = SPTAuth.defaultInstance().spotifyWebAuthenticationURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var auth = SPTAuth.defaultInstance()!
    var session : SPTSession!
    
    var player : SPTAudioStreamingController?
    var loginUrl : URL?
    
    @IBAction func btnPressed(_ sender: Any) {
        if UIApplication.shared.openURL(loginUrl!) {
            if auth.canHandle(auth.redirectURL) {
                // To do - build in error handling
            }
        }
    }
    
    @objc func updateAfterFirstLogin () {
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            self.session = firstTimeSession
            //initializePlayer(authSession: session)
            print("It works3!")

            func z (b : Bool) {
                if b {
                    print("It works2!")
                    performSegue(withIdentifier: "mySegue", sender: self)
                } else {
                    print("It works!")
                    performSegue(withIdentifier: "mySegue2", sender: self)
                }
            }
            
            Communicate.isLoggedIn(username: Important.getUsername(), f: z)
            
            
        /*     func t(z: [Playlist]) {
                for v in z {
                    func w(z2: [Track]) {
                        
                    }
                    Important.getPlaylist(k: v.url, f: w)
                    print(z)
                }
            }
            
            Important.getPlaylistNames(f: t)
        }
    } */
    
    func initializePlayer(authSession:SPTSession){
        if self.player == nil {
            self.player = SPTAudioStreamingController.sharedInstance()
            self.player!.playbackDelegate = self
            self.player!.delegate = self
            try! player!.start(withClientId: auth.clientID)
            self.player!.login(withAccessToken: authSession.accessToken)
        }
    }
    
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
        // after a user authenticates a session, the SPTAudioStreamingController is then initialized and this method called
        print("logged in")
        self.player?.playSpotifyURI("spotify:track:58s6EuEYJdlb0kO7awm3Vp", startingWith: 0, startingWithPosition: 0, callback: { (error) in
            if (error != nil) {
                print("playing!")
            }
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
}
