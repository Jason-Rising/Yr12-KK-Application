//
//  EditEvent.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 9/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class EditEvent: UIViewController {
    var eventCSV = EventCSV()
    
    @IBOutlet weak var txtEventName: UITextField!
    @IBOutlet weak var txtDes: UITextView!
    @IBOutlet weak var lblPrice: UITextField!
    @IBOutlet weak var lblDead: UITextField!
    @IBOutlet weak var lblDeposit: UITextField!
    @IBOutlet weak var txtMeet: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    //Used to confirm deletion of event
    @IBOutlet weak var txtDelete: UITextField!
    
    @IBOutlet weak var lblError: UILabel!
    
    @IBAction func SaveChanges(_ sender: UIButton) {
        //validation
        if (txtEventName.text == "" || lblPrice.text == "" || lblDeposit.text == "" || txtMeet.text == "" || txtPass.text == "" || txtUser.text == ""){
            lblError.text = "Ensure all fields are filled"
            lblError.textColor = UIColor.red
        }else{
            //Update CSV to inputted text values
        eventCSV.editingEvent(eventName: txtEventName.text!, description: txtDes.text!, priceRan: lblPrice.text!, deadLine: lblDead.text!, meetUpTime: txtMeet.text!, password: txtPass.text!, depositLoc: lblDeposit.text!, username: txtUser.text!, eventStarted: "false", index: 0)
        //Return to event manager page
        //return to home page
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ManageEvent") as! ManageEvent
        self.present(newViewController, animated: true, completion: nil)
        }
        
    }
    
    //Delete Event
    @IBAction func DeleteEvent(_ sender: UIButton) {
        //Validation ensure event isn't active
        if (listEventModel[0].eventStarted == "false"){
        //Validation - Ensure that delete has been typed
        if (txtDelete.text == "delete" || txtDelete.text == "DELETE"){
            //Erase array and CSV
            eventCSV.deleteAtIndex()
            //Navigate to home screen
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomePage
            self.present(newViewController, animated: true, completion: nil)
        }else{
            lblError.textColor = UIColor.red
            lblError.text = "Type 'delete' to confirm action"
        }
        }else{
            lblError.text = "Cannot delete event while event is active"
            lblError.textColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        lblError.text = ""
        //Load csv data into text fields
        txtEventName.text = listEventModel[0].eventName
        txtDes.text = listEventModel[0].description
        lblDeposit.text = listEventModel[0].depositLoc
        lblDead.text = listEventModel[0].deadLine
        lblPrice.text = listEventModel[0].priceRan
        txtUser.text = listEventModel[0].username
        txtPass.text = listEventModel[0].password
        txtMeet.text = listEventModel[0].meetUpTime
        
        //Graphic settings
        txtDes.layer.borderWidth = 1
        txtDes.layer.borderColor = UIColor.black.cgColor
        
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
