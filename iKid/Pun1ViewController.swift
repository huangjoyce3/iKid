//
//  Pun1ViewController.swift
//  iKid
//
//  Created by Joyce Huang on 2/4/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class Pun1ViewController: UIViewController {
    fileprivate var p1 : Pun1ViewController!
    fileprivate var p2 : Pun2ViewController!
    fileprivate var start : ViewController!
    
    fileprivate func p1Builder() {
        if p1 == nil {
            p1 =
                storyboard?
                    .instantiateViewController(withIdentifier: "p1")
                as! Pun1ViewController
        }
    }

    fileprivate func p2Builder() {
        if p2 == nil {
            p2 =
                storyboard?
                    .instantiateViewController(withIdentifier: "p2")
                as! Pun2ViewController
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
    
    @IBOutlet weak var punJoke: UILabel!
    @IBOutlet weak var punNext: UIButton!
    @IBAction func clickNextPun(_ sender: Any) {
        switchViews()
    }
    
    func switchViews(){
        p1Builder()
        p2Builder()
        startBuilder()
        if punNext.titleLabel?.text == "Back" {
            punNext.isHidden = true
            switchViewController(p2, to: start)
        }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
        p2.view.frame = view.frame
        punJoke.text = ""
        switchViewController(p1, to: p2)
        punNext.setTitle("Back", for: .normal)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchViewController(nil, to: p1)
        punNext.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
