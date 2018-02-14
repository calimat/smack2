//
//  ChangeUserNameVC.swift
//  Smack
//
//  Created by Ricardo Herrera Petit on 2/13/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

class ChangeUserNameVC: UIViewController {

    //Outlets
    @IBOutlet weak var newUserNameTxT: UITextField!
    @IBOutlet weak var bgView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }
    
    
    func setupView() {
        
         newUserNameTxT.attributedPlaceholder = NSAttributedString(string: "new UserName", attributes: [NSAttributedStringKey.foregroundColor: smackPurplerPlaceholder])
        
        let closeTap = UIGestureRecognizer(target: self, action: #selector(ChangeUserNameVC.closeTap(_:) ))
        bgView.addGestureRecognizer(closeTap)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeUserNamePressed(_ sender: Any) {
        guard let newUserName = newUserNameTxT.text , newUserNameTxT.text != "" else { return }
        if AuthService.instance.isLoggedIn {
            AuthService.instance.changeUserName(newUserName: newUserName, completion: { (success) in
                if success {
                    //Username changed sucessfully
                    let user = UserDataService.instance
                    UserDataService.instance.setUserData(id: user.id, color: user.avatarColor, avatarName: user.avatarName, email: user.email, name: newUserName)
                     NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                     self.dismiss(animated: true, completion: nil)
                } else {
                     self.dismiss(animated: true, completion: nil)
                }
            })
        }
        
    }
    

    

}
