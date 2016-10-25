//
//  TutorialViewController.swift
//  NMcarousel
//
//  Created by Namrata Mohanty on 10/22/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
  
    @IBOutlet weak var buttonCarousel: UIButton!
    //@IBOutlet weak var buttonCarousel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        buttonCarousel.alpha = 0
        scrollView.contentSize = CGSize(width: 1500, height: 667)
        scrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        print("scrollingdidhappen")
        let page : Int = Int (round(scrollView.contentOffset.x/375
        ))
        
        // Set the current page, so the dots will update
        self.pageControl.currentPage = page
        if page == 3 {
            self.pageControl.isHidden = true
//            buttonCarousel.alpha = 1
        }
        else {
            buttonCarousel.alpha = 0
        }
        
        //Calculate the page we are on based on x coordinate position and width of scroll view
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 375))
        
        // Set the current page, so the dots will update
        self.pageControl.currentPage = page
        
        if page == 3 {
            self.pageControl.isHidden = true
            UIView.animate(withDuration: 0.33, animations: {
                self.buttonCarousel.alpha = 1
            })
            
        }
        else {
            self.pageControl.isHidden = false

            buttonCarousel.alpha = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
