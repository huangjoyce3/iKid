//
//  Dad1ViewController.swift
//  iKid
//
//  Created by Joyce Huang on 2/5/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class Dad1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dadButton.isHidden = false
        switchViewController(nil, to: dad1view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var dadButton: UIButton!
    
    fileprivate var dad1view : Dad1ViewController!
    fileprivate var dad2view : Dad2ViewController!
    fileprivate var dad3view : Dad3ViewController!
    fileprivate var start : ViewController!
    
    @IBAction func dadButtonClick(_ sender: Any) {
        switchViews()
    }
    
    fileprivate func dad1Builder() {
        if dad1view == nil {
            dad1view = storyboard?.instantiateViewController(withIdentifier: "d1")
                as! Dad1ViewController
        }
    }
    
    fileprivate func dad2Builder() {
        if dad2view == nil {
            dad2view = storyboard?.instantiateViewController(withIdentifier: "d2")
                as! Dad2ViewController
        }
    }
    
    fileprivate func dad3Builder() {
        if dad3view == nil {
            dad3view = storyboard?.instantiateViewController(withIdentifier: "d3")
                as! Dad3ViewController
        }
    }
    
    fileprivate func startBuilder() {
        if start == nil {
            start = storyboard?.instantiateViewController(withIdentifier: "Start")
                as! ViewController
        }
    }
    
    func switchViews(){
        dad1Builder()
        dad2Builder()
        dad3Builder()
        startBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        if dadButton.titleLabel?.text == "Back"{
            switchViewController(dad3view, to: start)
            dadButton.isHidden = true
        }
        
        if dad2view?.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dad2view.view.frame = view.frame
            switchViewController(dad2view, to: dad3view)
            dadButton.setTitle("Back", for: .normal)
        }else{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dad2view.view.frame = view.frame
            img1.isHidden = true
            switchViewController(dad1view, to: dad2view)
        }
        UIView.commitAnimations()
    }
    
    @IBOutlet weak var img1: UIImageView!
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
