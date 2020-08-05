//
//  DeleteAll.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 20/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class DeleteAll: UIViewController {
    var accounts = Engine()
    var event = EventCSV()
    
    @IBOutlet weak var deleteText: UITextField!
    
    @IBAction func deleteAll(_ sender: UIButton) {
        if (deleteText.text == "deleteAll"){
            event.deleteAtIndex()
            accounts.deleteAll()
            
            //return to home page
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomePage
            self.present(newViewController, animated: true, completion: nil)
        }       
    }
    
    
    override func viewDidLoad() {
        accounts.parseCSV()
        event.parseCSV()
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
