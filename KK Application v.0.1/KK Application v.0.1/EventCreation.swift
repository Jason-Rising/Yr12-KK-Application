//
//  EventCreation.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 18/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

var listEventModel: [EventCSV.EventCreate] = []

class EventCreation: UIViewController {

    var eventEngine = EventCSV()
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtPriceRan: UITextField!
    @IBOutlet weak var txtDeadline: UITextField!
    @IBOutlet weak var txtDeposit: UITextField!
    @IBOutlet weak var txtMeetUp: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var lblError: UILabel!
    
    //Button saves inputted info to CSVFile (Events)
    @IBAction func btnCreateEvent(_ sender: Any) {
        if (txtName.text == "" || txtPriceRan.text == "" || txtDeposit.text == "" || txtMeetUp.text == "" || txtPass.text == "" || txtUsername.text == ""){
            lblError.text = "Ensure all fields are filled"
            lblError.textColor = UIColor.red
            
        }else{
        //create new file if file doesn't exist
        eventEngine.createFileInDocuments()
        //Write to created CSV
            
          
            
            eventEngine.addNewEvent(eventName: txtName.text!, description: txtDescription.text!, priceRan: txtPriceRan.text!, deadLine: txtDeadline.text!, meetUpTime: txtMeetUp.text!, password: txtPass.text!, depositLoc: txtDeposit.text!, username: txtUsername.text!, eventStarted: "false")
            
        
        //return to home page
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomePage
        self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblError.text = ""
        eventEngine.parseCSV()
        print(listEventModel)
        //Graphical settings
        txtDescription.layer.borderWidth = 1
        txtDescription.layer.borderColor = UIColor.black.cgColor
        
        
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
