//
//  ViewController.swift
//  PictureDownloading
//
//  Created by macbook air on 15/12/2018.
//  Copyright © 2018 alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageFromWeb: UIImageView!
    @IBOutlet weak var firstImageButton: UIButton!
    @IBOutlet weak var secondImageButtn: UIButton!
    @IBOutlet weak var thirdImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let downloadQueue = DispatchQueue(label: "downloadQueue", qos: .userInitiated)
        
        downloadQueue.async {
            
            var imageURL: URL?
            
            switch sender {
            case self.firstImageButton:
                imageURL = URL(string: "https://images.wallpaperscraft.com/image/dog_black_underwater_swimming_water_74417_3840x2160.jpg")
            case self.secondImageButtn:
                imageURL = URL(string: "https://images.wallpaperscraft.com/image/cat_surprise_look_striped_96597_3840x2160.jpg")
            case self.thirdImageButton:
                imageURL = URL(string: "https://images.wallpaperscraft.com/image/owl_eyes_bird_predator_78841_3840x2160.jpg")
            default:
                imageURL = URL(string: "https://www.indulgemall.com/upload/slider/404-header.png")
            }
            
            guard let imageData = try? Data(contentsOf: imageURL!) else {return}
            
            DispatchQueue.main.async{
                self.imageFromWeb.image = UIImage(data: imageData)
            }
        }
    }
}

