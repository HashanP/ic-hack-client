//
//  CreateViewController.swift
//  Musique
//
//  Created by Hashan Punchihewa on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    var t = ""
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "A new group has been created with the identifier \"" + t + "\". Give this to other people, so they can join."
        
        // Do any additional setup after loading the view.
    }

    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("here")
        let sender2 = sender! as! TableViewController
        t = sender2.message
        label.text = "A new group has been created with the identifier \"" + sender2.message + "\". Give this to other people, so they can join."
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
