//
//  AccountEditPage2.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 26/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class AccountEditPage2: UIViewController {
    var accountEngine = Engine()
    
    @IBOutlet weak var txtWishlist: UITextView!
    @IBOutlet weak var lblError: UILabel!

    
    @IBAction func btnSave(_ sender: UIButton) {
        let wishListString = txtWishlist.text!
        print(wishListString)
        //Validation to determine if string contains any "/n"
        if (wishListString.contains("\n")){
            lblError.text = "Wishlist cannot contian new lines"
            lblError.textColor = UIColor.red
        }
        else{
        //If no "/n" are found than we can successfully update the CSV
        accountEngine.editingAccount(username: listAccountModel[AccountIndex].username, biography: listAccountModel[AccountIndex].biography, sex: listAccountModel[AccountIndex].sex, email: listAccountModel[AccountIndex].email, password: listAccountModel[AccountIndex].password, wishList: txtWishlist.text!,PQ1: listAccountModel[AccountIndex].PQ1, PQ2: listAccountModel[AccountIndex].PQ2, PQ3: listAccountModel[AccountIndex].PQ3, PQ4: listAccountModel[AccountIndex].PQ4, index: AccountIndex, partnerIndex: listAccountModel[AccountIndex].partnerIndex, hasPurchasedGift: listAccountModel[AccountIndex].hasPurchasedGift)
        
        //Return to profile view
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyAccountProfile") as! ViewMyProfile
        self.present(newViewController, animated: true, completion: nil)
    }
    }
    
    
    override func viewDidLoad() {
        txtWishlist.text = listAccountModel[AccountIndex].wishList
        lblError.text = ""
        super.viewDidLoad()
        
        //graphic settings
        txtWishlist.layer.borderWidth = 1
        txtWishlist.layer.borderColor = UIColor.black.cgColor

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
