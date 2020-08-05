//
//  ViewEvents.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 24/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit


class ViewEvents: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var engineEvent = EventCSV()
    @IBOutlet weak var tableView: UITableView!

    
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEventModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as!
        EventsTableViewCell
        
        cell.lblEventName.text = listEventModel[indexPath.row].eventName
        return cell
    }
    
    //Join and View Buttons
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //View Event Button
        let view = UITableViewRowAction(style: .normal, title: "View Event"){ action, index in
             EventIndex = indexPath.row
            //navigate to EventView ViewController
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "EventView") as! EventView
            self.present(newViewController, animated: true, completion: nil)
        }
        view.backgroundColor = UIColor.darkText
        
        //Join button
        let join = UITableViewRowAction(style: .normal, title: "Join Event"){ action, index in
            EventIndex = indexPath.row
            //navigate to Join Event View Controller
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "JoinEvent") as! JoinEvent
            self.present(newViewController, animated: true, completion: nil)
        }
        join.backgroundColor = UIColor.blue
        return [view,join]
    }
    
    
    
    
    
    override func viewDidLoad() {
        engineEvent.parseCSV()
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

