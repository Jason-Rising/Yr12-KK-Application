//
//  Engine.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 20/6/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import Foundation
class Engine: NSObject{
    
    struct AccountCreate {
    var username: String
    var biography: String
    var sex: String
    var email: String
    var password: String
    var wishList: String
    var PQ1: String
    var PQ2: String
    var PQ3: String
    var PQ4: String
        
    var partnerIndex: Int
    var hasPurchasedGift: String
        
        init(username: String, biography: String, sex:String, email:String, password: String, wishList: String, PQ1: String, PQ2: String, PQ3: String, PQ4: String, partnerIndex: Int, hasPurchasedGift: String) {
        self.username = username
        self.biography = biography
        self.sex = sex
        self.email = email
        self.password = password
        self.wishList = wishList
        self.PQ1 = PQ1
        self.PQ2 = PQ2
        self.PQ3 = PQ3
        self.PQ4 = PQ4
        self.partnerIndex = partnerIndex
        self.hasPurchasedGift = hasPurchasedGift
    }
}

func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    debugPrint(documentsDirectory)
    return documentsDirectory
}

    func createFileInDocuments() {
    let returnValue = UserDefaults.standard.bool(forKey: "key")
    if returnValue != true {
        let createCSV = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            as
            NSString).appendingPathComponent("accountInfo.csv")
        let dataCSV = FileManager.default.contents(atPath: Bundle.main.bundlePath + "/accountCSV.csv")
        FileManager.default.createFile(atPath: createCSV as String, contents: dataCSV, attributes: nil)
        print(getDirectoryPath())
        FileManager.default.contents(atPath: getDirectoryPath() +  "/accountInfo.csv")
        UserDefaults.standard.set(true, forKey: "key")
        UserDefaults.standard.synchronize()
    }
}

    func parseCSV () {
    // Load the CSV file and parse it
    let delimiter = "Ξ "
    let documentPath = getDirectoryPath() + "/accountInfo.csv"
    do {
        let content = try String(contentsOfFile: documentPath)
        listAccountModel = []
        let lines:[String] = content.components(separatedBy: NSCharacterSet.newlines) as [String]
        for line in lines {
            var values:[String] = []
            if line != "" {
                // For a line with double quotes
                // we use NSScanner to perform the parsing
                if line.range(of:"\n") != nil {
                    var textToScan:String = line
                    var value:NSString?
                    var textScanner:Scanner = Scanner(string: textToScan)
                    while textScanner.string != "" {
                        
                        if (textScanner.string as NSString).substring(to: 1) == "\n" {
                            textScanner.scanLocation += 1
                            textScanner.scanUpTo("\n", into: &value)
                            textScanner.scanLocation += 1
                        } else {
                            textScanner.scanUpTo(delimiter, into: &value)
                        }
                        
                        // Store the value into the values array
                        values.append(value! as String)
                        
                        // Retrieve the unscanned remainder of the string
                        if textScanner.scanLocation < textScanner.string.characters.count {
                            textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                        } else {
                            textToScan = ""
                        }
                        textScanner = Scanner(string: textToScan)
                    }
                    
                    // For a line without double quotes, we can simply separate the string
                    // by using the delimiter (e.g. comma)
                } else {
                    values = line.components(separatedBy: delimiter)
                }
                // Put the values into the tuple and add it to the items array
                let itemCSV = AccountCreate(username: values[0], biography: values[1], sex: (values[2]), email: (values[3]), password: values[4], wishList: values[5], PQ1: values[6], PQ2: values[7], PQ3: values[8], PQ4: values[9], partnerIndex: Int(values[10])! as Int, hasPurchasedGift: values[11])
                
                listAccountModel.append(itemCSV)
            }
        }
    } catch {
        print("File Read Error for file dataCSV")
    }
}

    func writeDataToFile(file:String, listAccountCSV: [AccountCreate]){
        debugPrint("writedata called")
        var csvData = ""
        for i in 0..<listAccountModel.count {
            let newLine = "\(listAccountCSV[i].username)Ξ \(listAccountCSV[i].biography)Ξ \(listAccountCSV[i].sex)Ξ \(listAccountCSV[i].email)Ξ \(listAccountCSV[i].password)Ξ \(listAccountCSV[i].wishList)Ξ \(listAccountCSV[i].PQ1)Ξ \(listAccountCSV[i].PQ2)Ξ \(listAccountCSV[i].PQ3)Ξ \(listAccountCSV[i].PQ4)Ξ \(listAccountCSV[i].partnerIndex)Ξ \(listAccountCSV[i].hasPurchasedGift)\n"
            csvData.append(newLine)
            debugPrint(listAccountModel)
        }
        debugPrint(file)
        let documentPath = getDirectoryPath() + file
        do{
            try csvData.write(toFile: documentPath, atomically: true, encoding: String.Encoding.utf8 )
            print(documentPath)
            debugPrint("wrote to file")
        } catch{
            debugPrint("Failed to create file CSV")
        }
    }
    
    
    func addNewAccount(username: String, biography: String, sex: String, email: String, password: String, wishList: String, PQ1: String, PQ2: String, PQ3: String, PQ4: String, partnerIndex: Int, hasPurchasedGift: String) {
        let newAccount: AccountCreate = AccountCreate(username: username, biography: biography, sex: sex, email: email, password: password, wishList: wishList, PQ1: PQ1, PQ2: PQ2, PQ3: PQ3, PQ4: PQ4, partnerIndex: partnerIndex, hasPurchasedGift: hasPurchasedGift)
        listAccountModel.append(newAccount)
        writeDataToFile(file: "/accountInfo.csv", listAccountCSV: listAccountModel)
    }
    
    func editingAccount(username: String, biography: String, sex: String, email: String, password: String, wishList: String, PQ1: String, PQ2: String, PQ3: String, PQ4: String, index: Int, partnerIndex: Int, hasPurchasedGift: String) {
        let editAccount: AccountCreate = AccountCreate(username: username, biography: biography, sex: sex, email: email, password: password, wishList: wishList, PQ1: PQ1, PQ2: PQ2, PQ3: PQ3, PQ4: PQ4, partnerIndex: partnerIndex, hasPurchasedGift: hasPurchasedGift)
        listAccountModel[index] = editAccount
        writeDataToFile(file: "/accountInfo.csv", listAccountCSV: listAccountModel)
    }
    
    func deleteAtIndex(index: Int){
        listAccountModel.remove(at: index)
        writeDataToFile(file: "/accountInfo.csv", listAccountCSV: listAccountModel)
    }
    func deleteAll(){
        listAccountModel.removeAll()
        writeDataToFile(file: "/accountInfo.csv", listAccountCSV: listAccountModel)

    }
    
    
}



