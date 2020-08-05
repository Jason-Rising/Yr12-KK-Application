//
//  ViewMyProfile.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 20/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class ViewMyProfile: UIViewController {
    var engine  = Engine()
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var lblWishList: UILabel!
    
    @IBOutlet weak var lblPQ1: UILabel!
    @IBOutlet weak var lblPQ2: UILabel!
    @IBOutlet weak var lblPQ3: UILabel!
    @IBOutlet weak var lblPQ4: UILabel!
    
    @IBOutlet weak var lblPurchase: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var partnerName: UILabel!
    
    
    //Update status when user has purchased their gift
    @IBAction func Purchased(_ sender: UIButton) {
        if (listEventModel[0].eventStarted == "true"){
        if (lblPurchase.text == "Gift not purchased"){
            engine.editingAccount(username: listAccountModel[AccountIndex].username, biography: listAccountModel[AccountIndex].biography, sex: listAccountModel[AccountIndex].sex, email: listAccountModel[AccountIndex].email, password: listAccountModel[AccountIndex].password, wishList: listAccountModel[AccountIndex].wishList, PQ1: listAccountModel[AccountIndex].PQ1, PQ2: listAccountModel[AccountIndex].PQ2, PQ3: listAccountModel[AccountIndex].PQ3, PQ4: listAccountModel[AccountIndex].PQ4, index: AccountIndex, partnerIndex: listAccountModel[AccountIndex].partnerIndex, hasPurchasedGift: "true")
            lblPurchase.text = "Gift purchased"
            lblPurchase.textColor = UIColor.green
        }else{
                        engine.editingAccount(username: listAccountModel[AccountIndex].username, biography: listAccountModel[AccountIndex].biography, sex: listAccountModel[AccountIndex].sex, email: listAccountModel[AccountIndex].email, password: listAccountModel[AccountIndex].password, wishList: listAccountModel[AccountIndex].wishList, PQ1: listAccountModel[AccountIndex].PQ1, PQ2: listAccountModel[AccountIndex].PQ2, PQ3: listAccountModel[AccountIndex].PQ3, PQ4: listAccountModel[AccountIndex].PQ4, index: AccountIndex, partnerIndex: listAccountModel[AccountIndex].partnerIndex, hasPurchasedGift: "false")
            lblPurchase.text = "Gift not purchased"
            lblPurchase.textColor = UIColor.black
            }
        }else{
            lblError.text = "Event hasn't started yet"
            lblError.textColor = UIColor.red
        }
        
    }
    
    //View KK partner's profile
    @IBAction func btnViewPartnerProfile(_ sender: UIButton) {
        if (listAccountModel[AccountIndex].partnerIndex != -1){
            //Load profile
            //return to home page
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "PartnerProfile") as! ViewPartnerProfile
            self.present(newViewController, animated: true, completion: nil)
        }else{
            //validation
            lblError.text = "You are currently not paired with anyone"
            lblError.textColor = UIColor.red
        }
    }
    
    
    
    override func viewDidLoad() {
        engine.parseCSV()
        lblUsername.text = listAccountModel[AccountIndex].username
        lblGender.text = "Gender: " + listAccountModel[AccountIndex].sex
        lblGender.sizeToFit()
        lblBio.text = listAccountModel[AccountIndex].biography
        lblBio.sizeToFit()
        lblWishList.text = listAccountModel[AccountIndex].wishList
        lblWishList.sizeToFit()
        //Personality Questions'
        lblPQ1.text = listAccountModel[AccountIndex].PQ1
        lblPQ2.text = listAccountModel[AccountIndex].PQ2
        lblPQ3.text = listAccountModel[AccountIndex].PQ3
        lblPQ4.text = listAccountModel[AccountIndex].PQ4
        lblPurchase.text = listAccountModel[AccountIndex].hasPurchasedGift
        if (lblPurchase.text == "false"){
            lblPurchase.text = "Gift not purchased"
        }else{
            lblPurchase.text = "Gift purchased"
        }
        
        if (listAccountModel[AccountIndex].partnerIndex == -1){
            partnerName.text = "-"
        }else{
            partnerName.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].username
        }
        
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
