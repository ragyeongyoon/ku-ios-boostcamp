//
//  ViewController.swift
//  KUFileIOBasic
//
//  Created by cscoi025 on 2019. 8. 16..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var mobileField: UITextField!
    var contacts: [ContactInfo] = []
    
    @IBAction func touchUpAddButton(_sender: UIButton) {
        let newContact: ContactInfo = ContactInfo()
        newContact.name = nameField.text
        newContact.mobile = mobileField.text
        newContact.created = Date() // 지금 이 순간
        contacts.append(newContact)
        saveContactsToFile()
    }
    

    
    func saveContactsToFile() {
        let encoder: JSONEncoder = JSONEncoder()
        let jsonData: Data
        do {
            jsonData = try encoder.encode(contacts)
        } catch {
            print("encode 실패" + error.localizedDescription)
            return
        }
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory,
                                                in: .userDomainMask,
                                                appropriateFor: nil,
                                                create: true)
        .appendingPathComponent("Contacts.json")
        
        do {
            try jsonData.write(to: filePath)
        } catch {
            print("write to path 실패" + error.localizedDescription)
            return
        }
        print("저장 완료. 현재 저장된 연락처 수 : \(contacts.count)")
        
    }
    
    @IBAction func touchUpResetButton(_sender: UIButton) {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory,
                                                    in: .userDomainMask,
                                                    appropriateFor: nil,
                                                    create: true)
        .appendingPathComponent("contacts.json")
        do {
            try FileManager.default.removeItem(at: filePath)
            contacts.removeAll()
        } catch {
            print("reset 실패" + error.localizedDescription)
        }
    }
    
    func loadContactsFromFile() {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory,
                                                     in: .userDomainMask,
                                                     appropriateFor: nil,
                                                     create: true)
            .appendingPathComponent("Contacts.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
        } catch {
            print("load data 실패" + error.localizedDescription)
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        do{
            contacts = try decoder.decode([ContactInfo].self, from: jsonData)
            print("파일에서 불러온 친구 수 : \(contacts.count)")
        } catch {
            print("decode json 실패" + error.localizedDescription)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContactsFromFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }


}

