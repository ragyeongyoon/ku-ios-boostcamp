//
//  SecondViewController.swift
//  프로젝트2 회원가입
//
//  Created by cscoi025 on 2019. 8. 8..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var forCheckImage: Int = 0
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchupSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func forSaveIdInformation(_ sender: UIButton) {
        UserInformation.shared.name = nameField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.imageView.image = originalImage
            forCheckImage = 1
            determineButtonState()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var selfIntroductionView: UITextView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet weak var checkPasswordField: UITextField!
    
    @IBAction func dismissSelf() {
        self.dismiss(animated: true,
                     completion: nil)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        passwordField.delegate = self
        checkPasswordField.delegate = self
        selfIntroductionView.delegate = self
        
        
    }
    
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.name = nameField.text
        UserInformation.shared.password = passwordField.text
        UserInformation.shared.checkPassword = checkPasswordField.text
        UserInformation.shared.selfIntroduction = selfIntroductionView.text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController의 view가 회면에 보여질 예정")
        nameField.text = UserInformation.shared.name
        passwordField.text = UserInformation.shared.password
        selfIntroductionView.text = UserInformation.shared.selfIntroduction
        checkPasswordField.text = UserInformation.shared.checkPassword
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController의 view가 화면에서 사라질 예정")
        UserInformation.shared.name = nameField.text
        UserInformation.shared.password = passwordField.text
        UserInformation.shared.checkPassword = checkPasswordField.text
        UserInformation.shared.selfIntroduction = selfIntroductionView.text
    }
    
    func textViewDidChange(_ textView: UITextView) {
            determineButtonState()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController의 view가 화면에서 사라짐")
    }
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        determineButtonState()
    //        return true
    //
    //    }
    
   @IBAction func textFieldTextEdited(_ sender: UITextField){
            determineButtonState()
    }
 
  
    
   func determineButtonState() {
        if let name: String  = nameField.text, name.count > 0,
            let password: String = passwordField.text, password.count > 0,
            let checkPassword: String = checkPasswordField.text, checkPassword.count > 0,
            let selfIntroduction: String = selfIntroductionView.text,
            selfIntroduction.count > 0, forCheckImage == 1,
            checkPasswordField.text == passwordField.text {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false}
    
    }
    
}
