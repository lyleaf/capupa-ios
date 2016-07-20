//
//  SignInViewController.swift
//  Gamin
//
//  Created by yiling on 7/15/16.
//  Copyright © 2016 yiling. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser
        {
            //Logged In
        }
        else{
            //Not Logged in
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func SignInUser(sender: UIButton) {
        FIRAuth.auth()?.signInWithEmail(email.text!, password: password.text!) { (user, error) in
            if error == nil
            {
                //success in sign in
                self.performSegueWithIdentifier("signIn2DiscoverPage", sender: nil)
            }
            else
            {
                let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title:"OK", style: .Cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
