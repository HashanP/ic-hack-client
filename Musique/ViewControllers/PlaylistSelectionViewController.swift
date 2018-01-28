//
//  PlaylistSelectionViewController.swift
//  Musique
//
//  Created by Julie Emile on 28/01/2018.
//  Copyright © 2018 Julie Emile. All rights reserved.
//

import UIKit

class PlaylistSelectionViewController: UITableViewController {

    var playlistsList: [Playlist] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")

        func t(z: [Playlist]) {
            playlistsList = z
                self.tableView.reloadData()
        }
        
        Important.getPlaylistNames(f: t)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlistsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        let group = playlistsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = group.name
        
        //cell.GroupName
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
   
    @IBAction func Done(_ sender: UIBarButtonItem) {
    
        print("here")
    
        var checkedPlaylists : [Playlist] = []
    
                let cells = self.tableView.visibleCells as! Array<UITableViewCell>
             
             for i in 0..<(playlistsList.count) {
             // look at data
             if (cells[i].accessoryType == UITableViewCellAccessoryType.checkmark){
             checkedPlaylists.append(playlistsList[i])
             }
             }
        
            
            /* let cells = self.tableView.visibleCells as! Array<UITableViewCell>
            
            for cell in cells {
                // look at data
                if cell.accessoryType == UITableViewCellAccessoryType.checkmark {
                    checkedPlaylists.append(playlistsList[cell.accessibilityElementCount()])
                }
            }*/
        
            for p in checkedPlaylists {
                print(p.name)
            }
    
        
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
