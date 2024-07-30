//
//  LandingViewController.swift
//  OurWedding
//
//  Created by Bich.DN on 26/7/24.
//

import UIKit

class LandingViewController: UIViewController {


    @IBOutlet weak var album: UIView!
    @IBOutlet weak var message: UIView!
    @IBOutlet weak var story: UIView!
    @IBOutlet weak var home: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var vTabbar: UIView!
    override func viewWillAppear(_ animated: Bool) {
        configTabbar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func configTabbar() {
        vTabbar.layer.cornerRadius = 35
        vTabbar.clipsToBounds = true
        home.layer.cornerRadius = 25
        album.layer.cornerRadius = 25
        story.layer.cornerRadius = 25
        message.layer.cornerRadius = 25
    }
}
