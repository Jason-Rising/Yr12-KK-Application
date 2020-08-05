//
//  ViewAccountFromList.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 25/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class ViewAccountFromList: UIViewController {

    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var lblWishlistInfo: UILabel!
    
    @IBOutlet weak var PQ1: UILabel!
    @IBOutlet weak var PQ2: UILabel!
    @IBOutlet weak var PQ3: UILabel!
    @IBOutlet weak var PQ4: UILabel!
    
    
    
    override func viewDidLoad() {
        lblUsername.text = listAccountModel[AccountIndex].username
        lblGender.text = "Gender: " + listAccountModel[AccountIndex].sex
        lblBio.text = listAccountModel[AccountIndex].biography
        lblBio.sizeToFit()
        lblWishlistInfo.text = listAccountModel[AccountIndex].wishList
        PQ1.text = listAccountModel[AccountIndex].PQ1
        PQ2.text = listAccountModel[AccountIndex].PQ2
        PQ3.text = listAccountModel[AccountIndex].PQ3
        PQ4.text = listAccountModel[AccountIndex].PQ4
        
        
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
