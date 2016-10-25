//
//  ViewController.swift
//  NMcarousel
//
//  Created by Namrata Mohanty on 10/19/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewIntroImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = scrollViewIntroImage.frame.size    // CGSize(width: 375, height: 1500)
        scrollView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

