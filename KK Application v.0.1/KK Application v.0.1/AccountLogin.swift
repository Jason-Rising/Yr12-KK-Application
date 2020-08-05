//
//  AccountLogin.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 21/6/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

var AccountIndex = 0

class AccountLogin: UIViewController {

    var engine = Engine()
    var accountcreation = AccountCreation()
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    @IBAction func btnLogin(_ sender: UIButton) {
        //parse csv data in listAccountModel array
        engine.parseCSV()
        
        //search array for inputted username and password
        for i in 0...listAccountModel.count - 1{
            if txtUser.text == listAccountModel[i].username{
                if txtPass.text == listAccountModel[i].password{
                    
                    //To make the index global, allowing other ViewController load correct informaiton
                    AccountIndex = i
                    
                    //navigate to account profile
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyAccountProfile") as! ViewMyProfile
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
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblError.text = ""

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
