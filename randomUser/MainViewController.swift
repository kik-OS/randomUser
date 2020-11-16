//
//  ViewController.swift
//  randomUser
//
//  Created by Никита Гвоздиков on 15.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    static var currentRandomUser: Result?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var adressLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var dotLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var generateButtonOutlet: UIButton!
    
    @IBOutlet var stackWithImage: UIStackView!
    @IBOutlet var stackWithInfo: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        NetworkManager.generateData()
        generateButtonOutlet.pulsate()
        stackWithInfo.isHidden = true
        stackWithImage.isHidden = true
    }
    
    @IBAction func generateButtonPressed() {
        generateButtonOutlet.setTitle("Next Random Person", for: .normal)
        stackWithImage.isHidden = false
        stackWithInfo.isHidden = false
        showInfo()
    }
    
    
    
    private func showInfo() {
        NetworkManager.generateData()
        
        guard let randomUser = MainViewController.currentRandomUser else {return}
        
        guard let stringUrl = randomUser.picture?.medium else {return}
        guard let imageUrl = URL(string: stringUrl) else {return}
        guard let imageData = try? Data(contentsOf: imageUrl) else {return}
        imageView.image = UIImage(data: imageData)
        
        
        fullNameLabel.text = "\(randomUser.name?.title ?? "") \(randomUser.name?.first ?? "") \(randomUser.name?.last ?? "")"
        phoneLabel.text = randomUser.phone ?? ""
        emailLabel.text = randomUser.email ?? ""
        locationLabel.text = "\(randomUser.location?.country ?? ""), \(randomUser.location?.state ?? ""), \(randomUser.location?.city ?? "")"
        adressLabel.text = "\(String(randomUser.location?.postcode ?? 0)), \(randomUser.location?.street?.name ?? ""), \(String(randomUser.location?.street?.number ?? 0))"
        genderLabel.text = randomUser.gender ?? ""
        ageLabel.text = "\(String(randomUser.dob?.age ?? 0)) years old"
        dotLabel.text = randomUser.dob?.date ?? ""
        
    }
}





