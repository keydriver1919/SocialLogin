//
//  ViewController.swift
//  FBLogin
//
//  Created by change on 2021/12/26.
//

import UIKit
import FacebookLogin
import GoogleSignIn

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    let signInConfig = GIDConfiguration.init(clientID: "685981224235-pav19vu3qtenooetcllcv1g3jn7d9mo4.apps.googleusercontent.com")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let accessToken = AccessToken.current {
                print("\(accessToken.userID) login成功")
            } else {
                print("not login還沒")
            }
    }

    @IBAction func signIn(sender: Any) {
        let NextPage
            = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
          guard error == nil else {return}
            self.present(NextPage, animated: true, completion: nil)
            NextPage.modalPresentationStyle = .fullScreen
          // If sign in succeeded, display the app's main content View.
        }
    }

//    @IBAction func signOut(sender: Any) {
//      GIDSignIn.sharedInstance.signOut()
//    }

    
    @IBAction func loginButton(_ sender: Any) {
        let manager = LoginManager()
        let NextPage
            = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
         manager.logIn { (result) in
            if case LoginResult.success(granted: _, declined: _, token: _) = result {
                NextPage.modalPresentationStyle = .fullScreen
                self.present(NextPage, animated: true, completion: nil)
                print("login ok")
               } else {
                   print("login fail")
               }
         }
    }
}

