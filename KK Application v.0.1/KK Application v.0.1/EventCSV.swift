//
//  EventCSV.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 18/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import Foundation
class EventCSV: NSObject{
    
    struct EventCreate {
        var eventName: String
        var description: String
        var priceRan: String
        var deadLine: String
        var depositLoc: String
        var meetUpTime: String
        var password: String
        var username: String
        var eventStarted: String
        init(eventName: String, description: String, priceRan:String, deadLine:String, meetUpTime: String, password: String, depositLoc: String, username: String, eventStarted: String) {
            self.eventName = eventName
            self.description = description
            self.priceRan = priceRan
            self.deadLine = deadLine
            self.meetUpTime = meetUpTime
            self.password = password
            self.depositLoc = depositLoc
            self.username = username
            self.eventStarted = eventStarted
        }
    }
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        debugPrint(documentsDirectory)
        return documentsDirectory
    }
    
    func createFileInDocuments() {
        let returnValue = UserDefaults.standard.bool(forKey: "keyEvent")
        if returnValue != true {
            let createCSV = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                as
                NSString).appendingPathComponent("Events.csv")
            let dataCSV = FileManager.default.contents(atPath: Bundle.main.bundlePath + "/Events.csv")
            FileManager.default.createFile(atPath: createCSV as String, contents: dataCSV, attributes: nil)
            print(getDirectoryPath())
            FileManager.default.contents(atPath: getDirectoryPath() +  "/Events.csv")
            UserDefaults.standard.set(true, forKey: "keyEvent")
            UserDefaults.standard.synchronize()
        }
    }
    

    
    
    
    func parseCSV () {
        // Load the CSV file and parse it
        let delimiter = "Ξ "
        let documentPath = getDirectoryPath() + "/Events.csv"
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
                    let itemCSV = EventCreate(eventName: values[0], description: values[1], priceRan: (values[2]), deadLine: (values[3]), meetUpTime: values[4], password: values[5], depositLoc: values[6], username: values[7], eventStarted: values[8])
                    listEventModel.append(itemCSV)
                }
            }
        } catch {
            print("File Read Error for file dataCSV")
        }
    }
    
    func writeDataToFile(file:String, listEventModel: [EventCreate]){
        debugPrint("Event CSV: Writedata called")
        var csvData = ""
        for i in 0..<listEventModel.count {
            let newLine = "\(listEventModel[i].eventName)Ξ \(listEventModel[i].description)Ξ \(listEventModel[i].priceRan)Ξ \(listEventModel[i].deadLine)Ξ \(listEventModel[i].meetUpTime)Ξ \(listEventModel[i].password)Ξ \(listEventModel[i].depositLoc)Ξ \(listEventModel[i].username)Ξ \(listEventModel[i].eventStarted)\n"
            csvData.append(newLine)
            debugPrint(listEventModel)
        }
        debugPrint(file)
        let documentPath = getDirectoryPath() + file
        do{
            try csvData.write(toFile: documentPath, atomically: true, encoding: String.Encoding.utf8 )
            print(documentPath)
            debugPrint("Event CSV: Wrote to file")
        } catch{
            debugPrint("Failed to create file CSV")
        }
    }
    
    
    func addNewEvent(eventName: String, description: String, priceRan: String, deadLine: String, meetUpTime: String, password: String, depositLoc: String, username: String, eventStarted: String) {
        let newAccount: EventCreate = EventCreate(eventName: eventName, description: description, priceRan: priceRan, deadLine: deadLine, meetUpTime: meetUpTime, password:password, depositLoc: depositLoc, username: username, eventStarted: eventStarted)
        listEventModel.append(newAccount)
        writeDataToFile(file: "/Events.csv", listEventModel: listEventModel)
    }
    
    func editingEvent (eventName: String, description: String, priceRan: String, deadLine: String, meetUpTime: String, password: String, depositLoc: String, username: String, eventStarted: String, index: Int) {
        let editEvent: EventCreate = EventCreate(eventName: eventName, description: description, priceRan: priceRan, deadLine: deadLine, meetUpTime: meetUpTime, password:password, depositLoc: depositLoc, username: username, eventStarted: eventStarted)
        listEventModel[index] = editEvent
        writeDataToFile(file: "/Events.csv", listEventModel: listEventModel)
    }
    
    func deleteAtIndex(){
        listEventModel.removeAll()
        writeDataToFile(file: "/Events.csv", listEventModel: listEventModel)
    }
    
    func deleteExtra(){
        var newList: [EventCSV.EventCreate] = [listEventModel[0]]
        writeDataToFile(file: "/Events.csv", listEventModel: newList)
        listEventModel.removeAll()
        listEventModel = [newList[0]]
        newList.removeAll()
    }
    
}
