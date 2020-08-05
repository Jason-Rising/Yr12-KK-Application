//
//  AccountCreation.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 20/6/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

var listAccountModel: [Engine.AccountCreate] = []

class AccountCreation: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var engine = Engine()
    
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var displayGenderLabel: UILabel!
    
    //Account components
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var PQ1: UITextField!
    @IBOutlet weak var PQ2: UITextField!
    @IBOutlet weak var PQ3: UITextField!
    @IBOutlet weak var PQ4: UITextField!
    
    
    @IBOutlet weak var gender: UILabel!
    //Error message label (validation)
    @IBOutlet weak var errorMessage: UILabel!
    
    
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
        displayGenderLabel.text = genders[row]
        displayGenderLabel.textColor = UIColor.black
    }
    //End of picker functions
    
    
    //Save button
    @IBAction func CreateCurrentAccount(_ sender: UIButton) {
        //validation
        let bioString = biography.text!
        if (bioString.contains("\n")){
            errorMessage.text = ""
            errorMessage.textColor = UIColor.red
        }else{
        
        
        if (gender.text == "Selected gender will appear here"){
            gender.text = "other"
        }
        if (username.text == "" || biography.text == "" || email.text == "" || password.text == "" || PQ1.text == "" || PQ2.text == "" || PQ3.text == "" || PQ4.text == ""){
            errorMessage.text = "Field(s) input invalid. Please ensure all fields are filled"
            errorMessage.textColor = UIColor.red
        }else{
        
            
        
        
        //get accountsave file path
       // engine.getDirectoryPath()
            
        //create new file if file doesn't exist
            //NOTE: THIS LINE IS NOT THE REASON THAT THE FILE GETS OVERRIDED!
        engine.createFileInDocuments()

        //Write to created CSV
            engine.addNewAccount(username: username.text!, biography: biography.text!, sex: gender.text!, email: email.text!, password: password.text!, wishList: "", PQ1: PQ1.text!, PQ2: PQ2.text!, PQ3: PQ3.text!, PQ4: PQ4.text!, partnerIndex: -1, hasPurchasedGift: "false")
            
            //return to home page
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomePage") as! HomePage
            self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        displayGenderLabel.text = "Selected gender will appear here"
        errorMessage.text = ""
        biography.text = ""
        displayGenderLabel.textColor = UIColor.gray
        //Graphical settigns
        biography!.layer.borderWidth = 1
        biography!.layer.borderColor = UIColor.black.cgColor
        
        engine.parseCSV()
        //print(listAccountModel)
        
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
