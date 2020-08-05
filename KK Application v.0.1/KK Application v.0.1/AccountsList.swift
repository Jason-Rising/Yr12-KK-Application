//
//  AccountsList.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 25/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class AccountsList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //reference to script containing account CSV functions
    var accounts = Engine()
    //Tableview reference (accounts will be displayed here)
    @IBOutlet weak var TableView: UITableView!
    
    
    
    //TableView settings
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Make cell count equal to array length
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAccountModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as!
        AccountListCell
        
        cell.lblAccountName.text = listAccountModel[indexPath.row].username
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TableView.reloadData()
    }
    
    
    //View Button
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //View Event Button
        let view = UITableViewRowAction(style: .normal, title: "View Account"){ action, index in
            AccountIndex = indexPath.row
            //navigate to profileViewController
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AccountView") as! ViewAccountFromList
            self.present(newViewController, animated: true, completion: nil)
        }
        view.backgroundColor = UIColor.blue
        return [view]
    }
    
    
    
    override func viewDidLoad() {
        accounts.parseCSV()
        TableView.reloadData()
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
