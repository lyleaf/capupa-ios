//
//  ChallengeTableViewController.swift
//  Gamin
//
//  Created by yiling on 7/17/16.
//  Copyright © 2016 yiling. All rights reserved.
//

import UIKit
import Firebase


//MARK: Properties

class ChallengeTableViewController: UITableViewController {
    var ref: FIRDatabaseReference!
    var challenges: [FIRDataSnapshot]! = []
    private var _refHandle: FIRDatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ChallengeTableViewCell")
        configureDatabase()
        // loadSampleChallenges()
    }
    
    // MARK: Firebase
    deinit {
        self.ref.child("challenges").removeObserverWithHandle(_refHandle)
    }
    
    func configureDatabase() {
        ref = FIRDatabase.database().reference()
        print(self.ref.child("challenges").URL)
        
        // Listen for new messages in the Firebase database
        _refHandle = self.ref.child("challenges").observeEventType(.ChildAdded, withBlock: { (snapshot) -> Void in
            self.challenges.append(snapshot)
            print("add")
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.challenges.count-1, inSection: 0)], withRowAnimation: .Automatic)//?
        })
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//????
        //Fetches the appropriate challenge for the data source layout
        //let challenge = challenges[indexPath.row]
        let cellIdentifier = "ChallengeTableViewCell"
        // Unpack message from Firebase DataSnapshot
        let challengeSnapshot: FIRDataSnapshot! = self.challenges[indexPath.row]
        let challenge = challengeSnapshot.value as! Dictionary<String, String>
        
        
        let name = challenge["name"] as String!
        let text = challenge["text"] as String!
        print(name)
        print(text)
        
        
        
        let cell: ChallengeTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChallengeTableViewCell
        
        cell.titleLabel?.text = name + ": " + text
        //cell!.imageView?.image = UIImage(named: "ic_account_circle")
        
        
        // let text = challenge[Constants.MessageFields.text] as String!
        
        //let image1 = UIImage(named: "Challenge1")!
        //cell.challengeImageView.image = image1
        
        return cell
        
    }
    
    
    func loadSampleChallenges() {
        let image1 = UIImage(named: "Challenge1")!
        let challenge1 = Challenge(title: "Art Challenge", image: image1, detail: "Go to Nice and find the most beautiful place in Nice")!
        
        let image2 = UIImage(named: "Challenge2")!
        let challenge2 = Challenge(title: "Paul Challenge", image: image2, detail: "Find out the secret ingredients in beignet :)")!
        
        //challenges += [challenge1, challenge2]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
