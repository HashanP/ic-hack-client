//
//  CreateViewController.swift
//  Musique
//
//  Created by Julie Emile on 27/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {
    
   
    @IBOutlet weak var GroupName: UITextField!
    
    @IBAction func ConfirmBtn(_ sender: UIButton) {
        print("heree!")
        func v (b: Bool) {
            print(b)
        }
        
        Communicate.joinGroup(username: Important.getUsername(), group: GroupName.text!, f: v)
    }
    
    
/*    static func joinGroup(username: String, group: String,  f: @escaping ((Bool) -> ())) {
        let tv: Parameters = [
            username: username,
            group: group
        ]
        Alamofire.request(SERVER + "/join", method: .post, parameters: tv, encoding: JSONEncoding.default).responseObject { (response: DataResponse<CheckResponse>) in
            print("bonjour")
            let k = response.result.value?.response
            if let k2 = k {
                f(k2)
            }
        }
    }
*/
}
