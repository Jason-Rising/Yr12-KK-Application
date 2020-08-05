//
//  HomePage.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 21/6/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    var engineCSV = EventCSV()
    var accountCSV = Engine()
    
    @IBOutlet weak var lblError: UILabel!
    
    //Create new event
    @IBAction func btnEventCreate(_ sender: UIButton) {
        if (listEventModel.count == 0){
            //navigate to event creation
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "EventCreation") as! EventCreation
            self.present(newViewController, animated: true, completion: nil)
        }else{
            lblError.text = "Event already exists. To edit or delete event navigate to 'Manage Event'"
            lblError.textColor = UIColor.red
        }
    }
    
    //Create new account
    @IBAction func CreateNewAccount(_ sender: UIButton) {
        //Validation - ensure event hasn't started
        if (listEventModel.count != 0){
        if (listEventModel[0].eventStarted == "true"){
            lblError.text = "Cannot create a new account while event is active"
            lblError.textColor = UIColor.red
        }else{
            //navigate to account creation
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AccountCreation") as! AccountCreation
            self.present(newViewController, animated: true, completion: nil)
            }
            
        }else{
            //navigate to account creation
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AccountCreation") as! AccountCreation
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    //Navigate to event manager login
    @IBAction func ManageEvent(_ sender: UIButton) {
        if (listEventModel.count == 0){
            lblError.text = "Event doesn't exist"
            lblError.textColor = UIColor.red
        }else{
            //navigate to event manager login
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "EventLogin") as! EventManagerLogin
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    //Navigate login validation
    @IBAction func accountLogin(_ sender: UIButton) {
        if (listAccountModel.count == 0){
            lblError.textColor = UIColor.red
            lblError.text = "No accounts exist"
            print(listAccountModel.count)
            
        }else{
            //navigate to login
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AccountLogin") as! AccountLogin
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    //Navigate event view validation
    @IBAction func viewEvent(_ sender: UIButton) {
        if (listEventModel.count == 0){
            lblError.textColor = UIColor.red
            lblError.text = "Event doesn't exist"
        }else{
            //navigate to event view
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "EventView") as! EventView
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //No CSV validation
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("/accountInfo.csv") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
            } else {
                print("FILE NOT AVAILABLE")
                engineCSV.createFileInDocuments()
                accountCSV.createFileInDocuments()
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
        
        lblError.text = ""
        engineCSV.parseCSV()
        accountCSV.parseCSV()
        print("EventCSV count: " + "\(listEventModel.count)")
        // Do any additional setup after loading the view.
    }

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
