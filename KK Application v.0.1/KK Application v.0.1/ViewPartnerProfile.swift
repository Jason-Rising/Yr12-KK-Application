//
//  ViewPartnerProfile.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 8/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class ViewPartnerProfile: UIViewController {
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBio: UITextView!
    @IBOutlet weak var lblWishlist: UITextView!
    @IBOutlet weak var lblPQ1: UILabel!
    @IBOutlet weak var lblPQ2: UILabel!
    @IBOutlet weak var lblPQ3: UILabel!
    @IBOutlet weak var lblPQ4: UILabel!
    
    
    
    

    override func viewDidLoad() {
        lblUser.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].username
        lblBio.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].biography
        lblGender.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].sex
        lblWishlist.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].wishList
        lblPQ1.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].PQ1
        lblPQ2.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].PQ2
        lblPQ3.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].PQ3
        lblPQ4.text = listAccountModel[listAccountModel[AccountIndex].partnerIndex].PQ4
        
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
