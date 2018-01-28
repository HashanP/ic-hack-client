//
//  LoggedInViewController2.swift
//  Musique
//
//  Created by Julie Emile on 27/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import UIKit

class LoggedInViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = UserDefaults.standard
        if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
            let sessionDataObj = sessionObj as! Data
            let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
            let session = firstTimeSession
            UserInfo.text = session.canonicalUsername
            func f(t: Bool) {
                print("helloo")
                print(t)
            }
            Communicate.isLoggedIn(username: session.canonicalUsername, f: f)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var UserInfo: UILabel!
    
  
    
}


