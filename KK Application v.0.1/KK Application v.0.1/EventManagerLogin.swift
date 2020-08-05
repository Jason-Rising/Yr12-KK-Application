//
//  EventManagerLogin.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 2/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class EventManagerLogin: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if (txtUser.text == listEventModel[0].username){
            if (txtPass.text == listEventModel[0].password){
                //return to home page
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "ManageEvent") as! ManageEvent
                self.present(newViewController, animated: true, completion: nil)
                
            }else{
                lblError.text = "Incorrect login"
                lblError.textColor = UIColor.red
            }
        }else{
            lblError.text = "Incorrect login"
            lblError.textColor = UIColor.red
        }
    }
    
    
    
    override func viewDidLoad() {
        lblError.text = ""
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
