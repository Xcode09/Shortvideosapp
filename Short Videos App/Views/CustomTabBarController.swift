//
//  CustomTabBarController.swift
//  Short Videos App
//
//  Created by Berisco Pvt on 25/08/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.backgroundColor = UIColor.hexStringToUIColor(hex: MyColors.darkPurpleColor)
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 5 // whatever you want
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner] // only the top right and left corners
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
