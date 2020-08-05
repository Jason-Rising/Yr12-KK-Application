//
//  ManageEvent.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 2/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class ManageEvent: UIViewController {
    var eventCSV = EventCSV()
    var accountCSV = Engine()
    
    var index: [Int] = []
    var shuffled = [Int]();
    
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    //navigate to edit event viewcontroller
    @IBAction func btnEdit(_ sender: UIButton) {
        if (listEventModel[0].eventStarted == "false"){
            //navigate to event edit viewcontroller
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "editEvent") as! EditEvent
            self.present(newViewController, animated: true, completion: nil)
        }else{
            lblError.text = "Cannot edit details while event is active"
            lblError.textColor = UIColor.red
        }
    }
    
    
    
    
    //Pairs all accounts with other accounts
    @IBAction func btnStartEvent(_ sender: UIButton) {
        if (listAccountModel.count < 1){
        if (listEventModel[0].eventStarted == "false"){
        //Must be more than one account to run event
            print("Event array before: " + "\(listEventModel)")
        eventCSV.editingEvent(eventName: listEventModel[0].eventName, description: listEventModel[0].description, priceRan: listEventModel[0].priceRan, deadLine: listEventModel[0].deadLine, meetUpTime: listEventModel[0].meetUpTime, password: listEventModel[0].password, depositLoc: listEventModel[0].depositLoc, username: listEventModel[0].username, eventStarted: "true", index: 0)
        print("Event array after: " + "\(listEventModel)")
        if (index.count > 0){
            //The Fisher-Yates Shuffle Algorithm:
            for i in 0..<listAccountModel.count {
                var rand = Int(arc4random_uniform(UInt32(index.count)))
                
                // Ensure that account cannot get itself as a KK partner
                if rand == i{
                    while (rand == i){
                         rand = Int(arc4random_uniform(UInt32(index.count)))
                    }
                }
                shuffled.append(index[rand])
                index.remove(at: rand)
            }
            print("Shuffle: " + "\(shuffled)")
            //Update visual display of event status
            lblStatus.text = "Status: Active"
            lblStatus.textColor = UIColor.green
            //Assign random account to every account
            print("listaccount count: " + "\(listAccountModel.count - 1)")
            for i in 0...listAccountModel.count - 1{
                print("i value: " + "\(i)")
                accountCSV.editingAccount(username: listAccountModel[i].username, biography: listAccountModel[i].biography, sex: listAccountModel[i].sex, email: listAccountModel[i].email, password: listAccountModel[i].password, wishList: listAccountModel[i].wishList, PQ1: listAccountModel[i].PQ1, PQ2: listAccountModel[i].PQ2, PQ3: listAccountModel[i].PQ3, PQ4: listAccountModel[i].PQ4, index: i, partnerIndex: shuffled[i], hasPurchasedGift: "false")
            }
        }
        else{
            lblError.textColor = UIColor.red
            lblError.text = "Not enough accounts to start event"
            }
            
        }else{
            lblError.textColor = UIColor.red
            lblError.text = "Event already started"
        }
        }
        lblError.textColor = UIColor.red
        lblError.text = "Not enough accounts to start event"
    }
    
    //Button will end event
    @IBAction func btnEndEvent(_ sender: UIButton) {
        //Set event start status to false
         eventCSV.editingEvent(eventName: listEventModel[0].eventName, description: listEventModel[0].description, priceRan: listEventModel[0].priceRan, deadLine: listEventModel[0].deadLine, meetUpTime: listEventModel[0].meetUpTime, password: listEventModel[0].password, depositLoc: listEventModel[0].depositLoc, username: listEventModel[0].username, eventStarted: "false", index: 0)
        //Update visual display of event status
        lblStatus.text = "Status: Ended"
        lblStatus.textColor = UIColor.red
        //Update every account profile to have purchased gift as false
        for i in 0...listAccountModel.count - 1{
            accountCSV.editingAccount(username: listAccountModel[i].username, biography: listAccountModel[i].biography, sex: listAccountModel[i].sex, email: listAccountModel[i].email, password: listAccountModel[i].password, wishList: listAccountModel[i].wishList, PQ1: listAccountModel[i].PQ1, PQ2: listAccountModel[i].PQ2, PQ3: listAccountModel[i].PQ3, PQ4: listAccountModel[i].PQ4, index: i, partnerIndex: -1, hasPurchasedGift: "false")
        }
        
        eventCSV.deleteExtra()
        
        //To fix duplication issue - ensures that listeventmodel.count will be 1
     /*   if (listEventModel.count > 1){
            print("ListEventModel: " + "\(listEventModel.count)")
                        print("ListEventModel - 1: " + "\(listEventModel.count - 1)")
            for i in 1...listEventModel.count - 1{
                listEventModel.remove(at: i)    
                eventCSV.writeDataToFile(file: "/Events.csv", listEventModel: listEventModel)
            }
        }
 */
        //refresh page
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ManageEvent") as! ManageEvent
        self.present(newViewController, animated: false, completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        print("Event array starting: " + "\(listEventModel)")
        if (listEventModel.count == 0){
            eventCSV.parseCSV()
        }
        accountCSV.parseCSV()
        print("Event array viewDidLoad: " + "\(listEventModel)")

        if (listAccountModel.count < 1){
            print("not enough accounts")
        }else{
        for i in 0...listAccountModel.count - 1{
            index.append(i)}
        }
        lblError.text = ""
        lblEventName.text = listEventModel[0].eventName
        
        //Update visual indication of event status
        if (listEventModel[0].eventStarted == "true"){
            lblStatus.text = "Status: Active"
            lblStatus.textColor = UIColor.green
        }else{
            lblStatus.text = "Status: Ended"
            lblStatus.textColor = UIColor.red
        }
        
        super.viewDidLoad()

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
