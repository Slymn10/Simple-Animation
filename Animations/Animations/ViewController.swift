//
//  ViewController.swift
//  Animations
//
//  Created by Süleyman Koçak on 24.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tapButton: UIButton!

    var currentAnimation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:"10")
        tapButton.layer.cornerRadius = 15

    }
    @IBAction func tapButtonPressed(_ sender: UIButton) {
        sender.isHidden = true

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation{
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:self.imageView.transform = .identity
            case 2:UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.imageView.transform = CGAffineTransform(translationX: -100, y: -100)
            }) { (finished) in
                UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                    self.imageView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
                }
            case 3:self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 4:self.imageView.transform = .identity
            case 5:self.imageView.alpha = 0.1
            self.imageView.backgroundColor = .red
            case 6:self.imageView.alpha = 1
            self.imageView.backgroundColor = .clear
            default:
                break
            }
        }) { (finished) in
            sender.isHidden = false
        }


        currentAnimation += 1

        if currentAnimation > 7 {
            self.currentAnimation = 0
        }
    }

}

