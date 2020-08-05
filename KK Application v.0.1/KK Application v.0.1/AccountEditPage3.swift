//
//  AccountEditPage3.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 1/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class AccountEditPage3: UIViewController {
    var accountEngine = Engine()
    
    @IBOutlet weak var txtPQ1: UITextField!
    @IBOutlet weak var txtPQ2: UITextField!
    @IBOutlet weak var txtPQ3: UITextField!
    @IBOutlet weak var txtpq4: UITextField!
    
    
    
    @IBAction func SaveQuestions(_ sender: UIButton) {
        accountEngine.editingAccount(username: listAccountModel[AccountIndex].username, biography: listAccountModel[AccountIndex].biography, sex: listAccountModel[AccountIndex].sex, email: listAccountModel[AccountIndex].email, password: listAccountModel[AccountIndex].password, wishList: listAccountModel[AccountIndex].wishList, PQ1: txtPQ1.text!, PQ2: txtPQ2.text!, PQ3: txtPQ3.text!, PQ4: txtpq4.text!, index: AccountIndex, partnerIndex: listAccountModel[AccountIndex].partnerIndex, hasPurchasedGift: listAccountModel[AccountIndex].hasPurchasedGift)
        //Return to profile view
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyAccountProfile") as! ViewMyProfile
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        txtPQ1.text = listAccountModel[AccountIndex].PQ1
        txtPQ2.text = listAccountModel[AccountIndex].PQ2
        txtPQ3.text = listAccountModel[AccountIndex].PQ3
        txtpq4.text = listAccountModel[AccountIndex].PQ4
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
