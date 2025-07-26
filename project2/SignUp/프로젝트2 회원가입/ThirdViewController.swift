//
//  ThirdViewController.swift
//  프로젝트2 회원가입
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet var submitButton: UIButton!

    
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy//MM/dd hh:ss"
        return formatter
    } ()
    
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Cancel() {
        self.dismiss(animated: true, completion: nil)
        UserInformation.shared.name = nil
        UserInformation.shared.password = nil
        UserInformation.shared.checkPassword = nil
        UserInformation.shared.selfIntroduction = nil
    }
    
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value changed")
        
        let date: Date = self.datepicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.birthdayLabel.text = dateString
        determineButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.datepicker.addTarget(self,
                                  action: #selector(self.didDatePickerValueChanged(_:)),
                                  for: UIControlEvents.valueChanged)
        
        phoneNumberField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController의 view가 회면에 보여질 예정")
        birthdayLabel.text = UserInformation.shared.birthday
        phoneNumberField.text = UserInformation.shared.phoneNumber
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController의 view 가 화면에서 사라질 예정")
        UserInformation.shared.birthday = birthdayLabel.text
        UserInformation.shared.phoneNumber = phoneNumberField.text
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController의 view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("ViewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("ViewController의 view가 subview를 레이아웃 함")
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        determineButtonState()
//
//        return true
//    }
    
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func textFieldTextEdited(_ sender: UITextField){
        determineButtonState()
    }
    
    func determineButtonState() {
        if let phoneNumber: String  = phoneNumberField.text, phoneNumber.count > 0,
            let birthday: String = birthdayLabel.text, birthday.count > 0 {
            submitButton.isEnabled = true
        } else {
            submitButton.isEnabled = false
        }}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
