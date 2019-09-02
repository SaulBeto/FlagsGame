//
//  ViewController.swift
//  FlagsGame
//
//  Created by Saul Alberto Cortez Garcia on 8/14/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    var score           = 0
    var arrFlags        = [String]()
    var correctAnswer   = 0
    var titleAnswer     : String!
    var grayColor       = UIColor.lightGray.cgColor
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnFlag1: UIButton!
    @IBOutlet weak var btnFlag2: UIButton!
    @IBOutlet weak var btnFlag3: UIButton!
    
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        
        arrFlags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        setFlags()
        
    }
    
    //MARK: - Functions
    
    func setUpButtons() {
        btnFlag1.layer.borderWidth = 1
        btnFlag2.layer.borderWidth = 1
        btnFlag3.layer.borderWidth = 1
        
        btnFlag1.layer.borderColor = grayColor
        btnFlag2.layer.borderColor = grayColor
        btnFlag3.layer.borderColor = grayColor
    }
    
    /**
     *@brief Set flags in each button an generate correct answer.
     *@return @b (void)
     */
    /// - Parameter llamaCount: The number of llamas in the managed herd.
    func setFlags(action: UIAlertAction! = nil) {
        arrFlags.shuffle()
        
        btnFlag1.setImage(UIImage(named: arrFlags[0]), for: .normal)
        btnFlag2.setImage(UIImage(named: arrFlags[1]), for: .normal)
        btnFlag3.setImage(UIImage(named: arrFlags[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = arrFlags[correctAnswer].uppercased()
    }
    
    //MARK: - IBActions

    @IBAction func actButtonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            titleAnswer = "Correct!!"
            score += 1
        } else {
            titleAnswer = "Wrong :("
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: setFlags))
        present(ac, animated: true)
    }
    
}

