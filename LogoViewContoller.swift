//
//  LogoViewContoller.swift
//  UICollectionViewDemo
//
//  Created by MINI01 ACCELERON on 12/12/19.
//  Copyright © 2019 MINI01 ACCELERON. All rights reserved.
//

import UIKit

class LogoViewContoller: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var imageName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageInsideView()
    }
    
    private func setupImageInsideView() {
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name) {
            imageView.image = image
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
