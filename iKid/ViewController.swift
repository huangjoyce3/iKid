//
//  ViewController.swift
//  iKid
//
//  Created by Joyce Huang on 2/3/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate var kk1ViewController : KK1ViewController!
    fileprivate var kk2ViewController : KK2ViewController!
    fileprivate var kk3ViewController : KK3ViewController!
    fileprivate var kk4ViewController : KK4ViewController!

    fileprivate func kk1Builder() {
        if kk1ViewController == nil {
            kk1ViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "kk1")
                as! KK1ViewController
        }
    }
    
    fileprivate func kk2Builder() {
        if kk2ViewController == nil {
            kk2ViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "kk2")
                as! KK2ViewController
        }
    }
    
    fileprivate func kk3Builder() {
        if kk3ViewController == nil {
            kk3ViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "kk3")
                as! KK3ViewController
        }
    }
    
    fileprivate func kk4Builder() {
        if kk4ViewController == nil {
            kk4ViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "kk4")
                as! KK4ViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchViewController(nil, to:kk1ViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNext(_ sender: UIButton) {
        switchViews()
    }
    
    func switchViews(){
        kk1Builder()
        kk2Builder()
        kk3Builder()
        kk4Builder()
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)

        if kk1ViewController != nil &&
            kk1ViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            kk2ViewController.view.frame = view.frame
            switchViewController(kk1ViewController, to: kk2ViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            kk1ViewController.view.frame = view.frame
            switchViewController(kk2ViewController, to: kk1ViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }

}

