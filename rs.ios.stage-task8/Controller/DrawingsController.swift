//
//  DrawingsController.swift
//  rs.ios.stage-task8
//
//  Created by Admin on 21.07.2021.
//

import UIKit

public class DrawingsController: UIViewController {

    @objc weak var delegate: DrawingsControllerDelegate!
    @objc public var selectedPicture: CanvasPicture = .head
    var selectedButtons: [RoundedButton]?
    var buttons: [RoundedButton]?
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Drawings"
        let btn1 = RoundedButton()
        btn1.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
        btn1.setTitle("Planet", for: .normal)
        let btn2 = RoundedButton()
        btn2.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
        btn2.setTitle("Head", for: .normal)
        let btn3 = RoundedButton()
        btn3.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
        btn3.setTitle("Tree", for: .normal)
        let btn4 = RoundedButton()
        btn4.addTarget(self, action: #selector(selectItem(_:)), for: .touchUpInside)
        btn4.setTitle("Landscape", for: .normal)
        
        buttons = [btn1, btn2, btn3, btn4]
        let stackView = UIStackView(arrangedSubviews: buttons!)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        btn1.translatesAutoresizingMaskIntoConstraints = false
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn3.translatesAutoresizingMaskIntoConstraints = false
        btn4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 114), stackView.widthAnchor.constraint(equalToConstant: 200), stackView.heightAnchor.constraint(equalToConstant: 205), stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        self.buttons![Int(selectedPicture.rawValue)].isSelected = true;
    }

    
    @objc func selectItem(_ sender: RoundedButton){
        self.buttons![Int(self.selectedPicture.rawValue)].isSelected = false;
        selectedPicture = CanvasPicture(rawValue: UInt(buttons!.firstIndex(of: sender)!))!
        sender.isSelected = true
        delegate?.didSelectPicture(selectedPicture: self.selectedPicture)
    }
}

@objc public protocol DrawingsControllerDelegate{
    func didSelectPicture(selectedPicture: CanvasPicture)
}
