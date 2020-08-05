//
//  AccountEditPage1.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 26/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class AccountEditPage1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var engine = Engine()
    
    //Editable variables
    @IBOutlet weak var txtBio: UITextView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    //Used to confirm account deletion
    @IBOutlet weak var txtDelete: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    
    
    //Picker variables
    @IBOutlet weak var lblPickerValue: UILabel!
    @IBOutlet weak var GenderPicker: UIPickerView!
    
    //Gender Options
    let genders = ["Male", "Female", "Other"]
    
    //Gender Picker Funcations:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblPickerValue.text = genders[row]
        lblPickerValue.textColor = UIColor.black
    }
    //End of picker functions
    
    //Next btn editAccountCSV
    @IBAction func btnNext(_ sender: UIButton) {
        engine.editingAccount(username: listAccountModel[AccountIndex].username, biography: txtBio.text!, sex: lblPickerValue.text!, email: txtEmail.text!, password: txtPass.text!, wishList: listAccountModel[AccountIndex].wishList, PQ1: listAccountModel[AccountIndex].PQ1, PQ2: listAccountModel[AccountIndex].PQ2, PQ3: listAccountModel[AccountIndex].PQ3, PQ4: listAccountModel[AccountIndex].PQ4, index: AccountIndex, partnerIndex: listAccountModel[AccountIndex].partnerIndex, hasPurchasedGift: listAccountModel[AccountIndex].hasPurchasedGift)
        
        //Return to profile view
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyAccountProfile") as! ViewMyProfile
        self.present(newViewController, animated: true, completion: nil)
    }
    
    //Delete account
    @IBAction func DeleteAccount(_ sender: UIButton) {
        //Ensure event is not active
        if (listEventModel.count == 0){
            if (txtDelete.text == "delete" || txtDelete.text == "DELETE"){
                engine.deleteAtIndex(index: AccountIndex)
                //Return to homepage
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomePage
                self.present(newViewController, animated: true, completion: nil)
            }else{
                lblError.text = "Type delete to confrim action"
                lblError.textColor = UIColor.red
            }
        }
        else if (listEventModel[0].eventStarted == "false"){
            //Ensure user has typed in delete
            if (txtDelete.text == "delete" || txtDelete.text == "DELETE"){
                engine.deleteAtIndex(index: AccountIndex)
                //Return to homepage
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomePage
                self.present(newViewController, animated: true, completion: nil)
            }
            else{
                lblError.text = "Type delete to confrim action"
                lblError.textColor = UIColor.red
            }
        }else{
            lblError.text = "Cannot delete account while event is active"
            lblError.textColor = UIColor.red
        }
    }
    
    
    
    override func viewDidLoad() {
        //Setting gender settings from AccountsCSV
        lblPickerValue.text = listAccountModel[AccountIndex].sex
        if (lblPickerValue.text == "Female"){
            GenderPicker.selectRow(1, inComponent: 0, animated: true)
        }
        else if (lblPickerValue.text == "Other"){
            GenderPicker.selectRow(2, inComponent: 0, animated: true)
        }
        //Updated vaules to reflect account details
        txtBio.text = listAccountModel[AccountIndex].biography
        txtEmail.text = listAccountModel[AccountIndex].email
        txtPass.text = listAccountModel[AccountIndex].password
        //Adding a border to biography text view
            txtBio!.layer.borderWidth = 1
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
