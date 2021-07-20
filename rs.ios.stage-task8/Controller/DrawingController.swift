//
//  DrawingController.swift
//  rs.ios.stage-task8
//
//  Created by Admin on 17.07.2021.
//

import UIKit

@objc class DrawingController: UIViewController {
    
    var selectedPicture: CanvasPicture = .head {
        willSet{
            if newValue != self.selectedPicture {
                canvas.picture = newValue
            }
        }
    }
    var selectedColors = [UIColor]()
    var time: Float = 1.0
    var timer: Timer?

    @IBOutlet var timerButton: RoundedButton!
    @IBOutlet var paletteButton: RoundedButton!
    @IBOutlet var drawButton: RoundedButton!
    @IBOutlet var shareButton: RoundedButton!
    @IBOutlet var canvas: Canvas!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        canvas.picture = self.selectedPicture
        self.resetState()
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
        childVC.view.frame = CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: view.frame.height/2 + 40)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        childVC.colors = self.selectedColors
        
    }
    
    @IBAction func openTimer(_ sender: Any) {
        let childVC = TimerController()
        self.addChild(childVC)
        childVC.delegate = self
        childVC.view.frame = CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: view.frame.height/2 + 40)
        childVC.value = time
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    @IBAction func drawAction(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        if canvas.grade >= 1.0 {
            self.reset()
        }
        else {
            canvas.colors = selectedColors
            canvas.resetColors()
            self.draw()
        }
        drawButton.isEnabled = false
        paletteButton.isEnabled = false
        timerButton.isEnabled = false
        shareButton.isEnabled = false
 
        
    }
    @IBAction func shareAction(_ sender: Any) {
        let imageRenderer = UIGraphicsImageRenderer(size: canvas.frame.size)
        let image = imageRenderer.image{ctx in
            return canvas.currentLayer.render(in: ctx.cgContext)
        }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
            }
    
    func reset(){
        
        let step: Float = 1.0 / 30
        let interval: Float = 1.0 / 60
        let timer = Timer(timeInterval: TimeInterval(interval), repeats: true, block: {[weak self]
            timer in
            guard let self = self else { return }
            self.canvas.grade -= step
            if (self.canvas.grade <= 0){
                timer.invalidate()
                self.timer = nil
                self.resetState()
            }
            self.canvas.setNeedsDisplay()
        })
        self.timer = timer
        RunLoop.current.add(timer, forMode: .default)
    }


func draw(){
   
    self.canvas.setNeedsDisplay()
    let step: Float = 1.0 / (60 * time)
    let interval: Float = 1.0 / 60
    let timer = Timer(timeInterval: TimeInterval(interval), repeats: true, block: {[weak self]
        timer in
        guard let self = self else { return }
        self.canvas.grade += step
        if (self.canvas.grade >= 1.0){
            timer.invalidate()
            self.timer = nil
            self.drawButton.setTitle("Reset", for: .normal)
            self.drawButton.isEnabled = true
            self.paletteButton.isEnabled = false
            self.timerButton.isEnabled = false
            self.shareButton.isEnabled = true
        }
        self.canvas.setNeedsDisplay()
    })
    self.timer = timer
    RunLoop.current.add(timer, forMode: .default)
}

    func resetState(){
        self.drawButton.setTitle("Draw", for: .normal)
        self.drawButton.isEnabled = true
        self.paletteButton.isEnabled = true
        self.timerButton.isEnabled = true
        self.shareButton.isEnabled = false
    }
}

extension DrawingController: ChoiceControllerDelegate{
    func didSelect(_ selectedPicture: CanvasPicture) {
        self.selectedPicture = selectedPicture
        canvas.grade = 0.0
        resetState()
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

extension DrawingController: TimerControllerDelegate{
    func timerController(_ controller: TimerController, willDismissWithValue value: Float) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
        time = value
    }
}
