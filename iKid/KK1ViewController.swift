//
//  KK1ViewController.swift
//  iKid
//
//  Created by Joyce Huang on 2/4/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class KK1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        kkButton.isHidden = false
        switchViewController(nil, to: kk1ViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnNext(_ sender: UIButton) {
        switchViews()
    }
    @IBOutlet weak var label1: UILabel!
    
    fileprivate var kk1ViewController : KK1ViewController!
    fileprivate var kk2ViewController : KK2ViewController!
    fileprivate var kk3ViewController : KK3ViewController!
    fileprivate var kk4ViewController : KK4ViewController!
    fileprivate var kk5ViewController : KK5ViewController!
    fileprivate var start : ViewController!
    
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
    
    @IBOutlet weak var kkjoke1: NSLayoutConstraint!
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
    
    fileprivate func kk5Builder() {
        if kk5ViewController == nil {
            kk5ViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "kk5")
                as! KK5ViewController
        }
    }
    
    fileprivate func startBuilder() {
        if start == nil {
            start =
                storyboard?
                    .instantiateViewController(withIdentifier: "Start")
                as! ViewController
        }
    }
    
    @IBOutlet weak var kkButton: UIButton!
    
    func switchViews(){
        kk1Builder()
        kk2Builder()
        kk3Builder()
        kk4Builder()
        kk5Builder()
        startBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        if kkButton.titleLabel?.text == "Back"{
            switchViewController(kk5ViewController, to: start)
            kkButton.isHidden = true
        }
        
        if kk4ViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            kk4ViewController.view.frame = view.frame
            switchViewController(kk4ViewController, to: kk5ViewController)
            kkButton.setTitle("Back", for: .normal)
        }else if kk3ViewController?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            kk4ViewController.view.frame = view.frame
            switchViewController(kk3ViewController, to: kk4ViewController)
        }else if kk2ViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            kk3ViewController.view.frame = view.frame
            switchViewController(kk2ViewController, to: kk3ViewController)
        }else{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            kk2ViewController.view.frame = view.frame
            label1.text = ""
            switchViewController(kk1ViewController, to: kk2ViewController)
        }
        UIView.commitAnimations()
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        switchViews()
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
