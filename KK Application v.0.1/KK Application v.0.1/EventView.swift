//
//  EventView.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 25/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class EventView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var engine = Engine()
    var sort = false
    
    
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var lblPriceRange: UILabel!
    @IBOutlet weak var lblDeadLine: UILabel!
    @IBOutlet weak var lblDepositLoc: UILabel!
    @IBOutlet weak var lblMeetTime: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAccountModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        TableViewCell
        
        cell.lblAccountUsername.text = listAccountModel[indexPath.row].username
        if (sort == true){
            if (listAccountModel[indexPath.row].hasPurchasedGift == "true"){
                cell.backgroundColor = UIColor.green
            }
        }else{
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    
    @IBAction func SortByPurchase(_ sender: UIButton) {
        if (sort == false){
            sort = true
            
        }else{
            sort = false
        }
        tableView.reloadData()
    }
    
    
    //View Button
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //View Event Button
        let view = UITableViewRowAction(style: .normal, title: "View Account"){ action, index in
            AccountIndex = indexPath.row
            //navigate to profileViewController
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AccountViewFromEvent") as! ViewAccountFromList
            self.present(newViewController, animated: true, completion: nil)
        }
        view.backgroundColor = UIColor.blue
        return [view]
    }
    
    override func viewDidLoad() {
        lblEventName.text = listEventModel[0].eventName
        eventDescription.text = listEventModel[0].description
        eventDescription.sizeToFit()
        lblPriceRange.text = listEventModel[0].priceRan
        lblPriceRange.sizeToFit()
        lblDeadLine.text = listEventModel[0].deadLine
        lblDeadLine.sizeToFit()
        lblMeetTime.text = listEventModel[0].meetUpTime
        lblDepositLoc.text = listEventModel[0].depositLoc
        lblDepositLoc.sizeToFit()
        lblMeetTime.sizeToFit()
        
        if (listEventModel[0].eventStarted == "true"){
            lblStatus.text = "Event Status: Active"
            lblStatus.textColor = UIColor.green
        }else{
            lblStatus.text = "Event Status: Inactive"
            lblStatus.textColor = UIColor.red
        }
        
        engine.parseCSV()
        tableView.reloadData()
        
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
