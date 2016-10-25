//
//  LoginViewController.swift
//  NMcarousel
//
//  Created by Namrata Mohanty on 10/20/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
   
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
  
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
   
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialY = fieldParentView.frame.origin.y
        offset = -90
        scrollView.delegate = self
        
//        scrollView.contentSize = CGSize(width: 375, height: 1000)
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 30
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -180
        

        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            //let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            self.fieldParentView.frame.origin.y = self.initialY + self.offset
            self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            // Scroll the scrollview up
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            self.fieldParentView.frame.origin.y = self.initialY
             self.buttonParentView.frame.origin.y = self.buttonInitialY
           
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
   
    @IBAction func onTapback(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)

    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    @IBAction func onTapsign(_ sender: AnyObject) {
        self.activityIndicator.startAnimating()
        loginButton.isSelected = true
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            self.activityIndicator.stopAnimating()
            // create an OK action
            
            let alertcontroller = UIAlertController(title: "Email required", message: "Please enter your email address", preferredStyle: .alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here
                print("ok")
            }
            
            // add the OK action to the alert controller
            alertcontroller.addAction(OKAction)
            
            present(alertcontroller, animated: true) {
                print("ok")
                // optional code for what happens after the alert controller has finished presenting
                
                //    let okAction = UIAlertAction(title:"Ok", style: default, handler: { (action:UIAlertAction) in
                //      self.print("you pressed ok")
            }
        }
            
        else if emailField.text == "namrata@gmail.com" &&
            passwordField.text == "ava" {
            //if correct credentials
            
            // Delay for 2 seconds, then run the code between the braces.
            let secondsToDelay = 2.0
            run(after: secondsToDelay)
            {
                // This code will run after the delay
                //delay(2.0, closure: {
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            //)
        }
        else {
            let secondsToDelay = 2.0
            run(after: secondsToDelay) {
                self.activityIndicator.stopAnimating()
                // create an OK action
                
                let alertcontroller = UIAlertController(title: "Invalid email or password", message: "Please enter a valid email or password", preferredStyle: .alert)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here
                    print("ok")
                }
                
                
                // add the OK action to the alert controller
                alertcontroller.addAction(OKAction)
                
                self.present(alertcontroller, animated: true) {
                    print("ok")
                    // optional code for what happens after the alert controller has finished presenting
                    
                    //    let okAction = UIAlertAction(title:"Ok", style: default, handler: { (action:UIAlertAction) in
                    //      self.print("you pressed ok")
                }
            }
        }
    }
}


        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


