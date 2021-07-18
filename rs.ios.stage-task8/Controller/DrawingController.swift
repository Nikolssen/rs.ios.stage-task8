//
//  DrawingController.swift
//  rs.ios.stage-task8
//
//  Created by Admin on 17.07.2021.
//

import UIKit

@objc class DrawingController: UIViewController {

    var selectedPicture: CanvasPicture = .planet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

    }
    
    
    private func setupNavigationBar() {
        navigationItem.title = "Artist"
        let barButtonItem = UIBarButtonItem(title: "Drawings", style: .plain, target: self, action: #selector(showMenu(sender:)))
        let attributes = [NSAttributedString.Key.font : UIFont(name: "Montserrat-Regular", size: 17.0)!, NSAttributedString.Key.foregroundColor : UIColor(named: "Light Green Sea")!]
        
        barButtonItem.setTitleTextAttributes(attributes, for: .normal);
        barButtonItem.setTitleTextAttributes(attributes, for: .highlighted);

        navigationItem.rightBarButtonItem = barButtonItem;
    }
    
    
   @objc func showMenu(sender: UIBarButtonItem){
        let controller = ChoiceController(selectedPicture: selectedPicture)
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    
    }


}

extension DrawingController: ChoiceControllerDelegate{
    func didSelect(_ selectedPicture: CanvasPicture) {
        self.selectedPicture = selectedPicture
    }
}
