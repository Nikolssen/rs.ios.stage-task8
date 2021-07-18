//
//  DrawingController.swift
//  rs.ios.stage-task8
//
//  Created by Admin on 17.07.2021.
//

import UIKit

@objc class DrawingController: UIViewController {

    var selectedPicture: CanvasPicture = .planet
    var selectedColors: [UIColor]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

    }
    
    
    private func setupNavigationBar() {
        navigationItem.title = "Artist"
        let barButtonItem = UIBarButtonItem(title: "Drawings", style: .plain, target: self, action: #selector(showMenu(sender:)))

        navigationItem.rightBarButtonItem = barButtonItem;
    }
    
    
   @objc func showMenu(sender: UIBarButtonItem){
        let controller = ChoiceController(selectedPicture: selectedPicture)
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    
    }

    @IBAction func openPalette(_ sender: Any) {
        let childVC = PaletteController()
        self.addChild(childVC)
        childVC.delegate = self
        childVC.view.frame = CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: view.frame.height/2)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        
    }
    
    @IBAction func openTimer(_ sender: Any) {
    }
}

extension DrawingController: ChoiceControllerDelegate{
    func didSelect(_ selectedPicture: CanvasPicture) {
        self.selectedPicture = selectedPicture
    }
}

extension DrawingController: PaletteControllerDelegate{
    func paletteController(_ controller: PaletteController, willDismissWith colors: [UIColor]) {
        selectedColors = colors
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }
    
 
    
    
    
}
