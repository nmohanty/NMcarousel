//
//  settingsViewController.swift
//  NMcarousel
//
//  Created by Namrata Mohanty on 10/23/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var signingout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapsignout(_ sender: AnyObject) {
        let alertcontroller = UIAlertController(title: "Are you sure you want to sign out?", message: "", preferredStyle: .actionSheet)
        
        let signoutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (action) in
            self.performSegue(withIdentifier: "signoutSegue", sender: nil)
        }
        // add the logout action to the alert controller
        
        alertcontroller.addAction(signoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertcontroller.addAction(cancelAction)
        
        present(alertcontroller, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
   
    @IBAction func onTapclose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
