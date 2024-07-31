//
//  ViewController.swift
//  OurWedding
//
//  Created by Bich.DN on 26/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }
    func configUI() {
        vButton.layer.cornerRadius = 27.5
    }
    
    @IBAction func onNextPressed(_ sender: Any) {
        print("pressed")
        let homeVC = LandingViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}

