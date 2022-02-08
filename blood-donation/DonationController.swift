//
//  DonationController.swift
//  blood-donation
//
//  Created by 최은성 on 2022/01/16.
//

import UIKit

class DonationController: UIViewController,UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var donationTitle: UILabel!
    
    @IBOutlet weak var reason: UITextView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var submit: UIButton!
    var flag: Bool = true

    
    
    @IBAction func didTapCheckButton(_ sender: UIButton) {
     if self.flag {
         sender.setImage(UIImage(systemName: "checkmark.rectangle"), for: .normal)
         flag = false;
         submit.isEnabled = true
     }
     else {
         sender.setImage(UIImage(systemName: "rectangle"), for: .normal)
         flag = true;
         submit.isEnabled = false
     }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reason.layer.borderWidth = 0.2
        self.reason.layer.borderColor = UIColor.lightGray.cgColor
        name.delegate = self
        number.delegate = self
        email.delegate = self
        id.delegate = self
        reason.delegate = self


        submit.isEnabled = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.name.resignFirstResponder()
        self.number.resignFirstResponder()
        self.email.resignFirstResponder()
        self.id.resignFirstResponder()
        self.reason.resignFirstResponder()

        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case name: number.becomeFirstResponder()
        case number: email.becomeFirstResponder()
        case email: id.becomeFirstResponder()
        case id: reason.becomeFirstResponder()
        default:
            print("textFieldShouldReturn Error")
        }
            return true
        }
    @IBAction func submitPressed(_ sender: UIButton) {
        //1. 경고창 내용 만들기
        let alert = UIAlertController(title:"제출완료!",
            message: "기부해주셔서 감사합니다 :)",
            preferredStyle: UIAlertController.Style.alert)
        //2. 확인 버튼 만들기
        let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
        //3. 확인 버튼을 경고창에 추가하기
        alert.addAction(cancle)
        //4. 경고창 보이기
        present(alert,animated: true,completion: nil)

    }
    
}
