
import Foundation
import UIKit

extension UIView {
    func dismissKeyboardOnTouch(){
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing(_:))))
    }
    
    func addBorder(color:UIColor,borderWidth:CGFloat)
    {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
    }
    func addCorner(cornerRadius:CGFloat)
    {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        
    }
    
    func addShadow(shadowRadius:CGFloat ,shadowOpacity:Float = 0.5)
    {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
    }
    func circleView()
    {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        
    }
    func circleView(width:CGFloat)
    {
        self.layer.cornerRadius = width / 2
        self.clipsToBounds = true
        
    }
    func addShadow(shadowRadius:CGFloat)
    {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
    }
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    enum LINE_POSITION {
        case LINE_POSITION_TOP
        case LINE_POSITION_BOTTOM
    }
    
    func takeScreenshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
    
    func findLabel(withText text: String) -> UILabel? {
        if let label = self as? UILabel, label.text == text {
            return label
        }
        
        for subview in self.subviews {
            if let found = subview.findLabel(withText: text) {
                return found
            }
        }
        
        return nil
    }
    
    func disableAutoTrans(){
    }
    func addShadow(cornerRadius: CGFloat = 4,
                   shadowRadius: CGFloat = 1,
                   shadowColor: UIColor = UIColor.black,
                   opacity: Float = 0.4,
                   offset: CGSize = CGSize(width: 0.0, height: 0.5))
    {
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    //////COSNTRAINTS
    
    
    @discardableResult
    func widthEqualTo(constant : CGFloat) ->NSLayoutConstraint{
        let generated = widthAnchor.constraint(equalToConstant: constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    
    @discardableResult
    func widthEqualTo(view : UIView) ->NSLayoutConstraint{
        let generated = widthAnchor.constraint(equalTo: view.widthAnchor)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func heightEqualTo(constant : CGFloat) ->NSLayoutConstraint{
        let generated = heightAnchor.constraint(equalToConstant: constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func heightEqualToPercentTo(view : UIView,percent : CGFloat) ->NSLayoutConstraint{
        let generated = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: percent)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func widthEqualToPercentTo(view : UIView,percent : CGFloat) ->NSLayoutConstraint{
        let generated = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: percent)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func heightEqualTo(view : UIView) ->NSLayoutConstraint{
        let generated = heightAnchor.constraint(equalTo: view.widthAnchor,constant : 0)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func sizeEqualTo(size : CGSize) -> [NSLayoutConstraint] {
        var array = [NSLayoutConstraint]()
        let widthConstraint = widthAnchor.constraint(equalToConstant: size.width)
        widthConstraint.isActive = true
        let heightConstraint = heightAnchor.constraint(equalToConstant: size.height)
        heightConstraint.isActive = true
        array.append(widthConstraint)
        array.append(heightConstraint)
        translatesAutoresizingMaskIntoConstraints = false
        return array
    }
    
    @discardableResult
    func topEqualTo(constraint : NSLayoutAnchor<NSLayoutYAxisAnchor>,constant : CGFloat = 0) -> NSLayoutConstraint {
        let generated = topAnchor.constraint(equalTo: constraint,constant : constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    
    @discardableResult
    func bottomEqualTo(constraint : NSLayoutAnchor<NSLayoutYAxisAnchor>,constant : CGFloat = 0) -> NSLayoutConstraint {
        let generated = bottomAnchor.constraint(equalTo: constraint,constant : constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func leadingEqualTo(constraint : NSLayoutAnchor<NSLayoutXAxisAnchor>,constant : CGFloat = 0) -> NSLayoutConstraint {
        let generated = leadingAnchor.constraint(equalTo: constraint,constant : constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func trailingEqualTo(constraint : NSLayoutAnchor<NSLayoutXAxisAnchor>,constant : CGFloat = 0) -> NSLayoutConstraint {
        let generated = trailingAnchor.constraint(equalTo: constraint,constant : constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    @discardableResult
    func centerXequalTo(constraint : NSLayoutAnchor<NSLayoutXAxisAnchor>,constant : CGFloat = 0) -> NSLayoutConstraint {
        let generated = centerXAnchor.constraint(equalTo: constraint,constant: constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func centerYequalTo(constraint : NSLayoutAnchor<NSLayoutYAxisAnchor>,constant : CGFloat = 0) -> NSLayoutConstraint {
        let generated = centerYAnchor.constraint(equalTo: constraint,constant: constant)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }

    @discardableResult
    func centerXequalTo(constraint : NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        let generated = centerXAnchor.constraint(equalTo: constraint)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    @discardableResult
    func centerYequalTo(constraint : NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        let generated = centerYAnchor.constraint(equalTo: constraint)
        generated.isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        return generated
    }
    
    func centerEqualTo(view : UIView)  {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func fullSizeEqualTo(view : UIView){
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func fullSizeEqualTo(view : UIView,constant : CGFloat){
        trailingAnchor.constraint(equalTo: view.trailingAnchor,constant : -constant).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor,constant : constant).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor,constant : constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -constant).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func fullSizeEqualTo(view : UIView,horizontalMa : CGFloat,verticalMa: CGFloat){
        trailingAnchor.constraint(equalTo: view.trailingAnchor,constant : -horizontalMa).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor,constant : horizontalMa).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor,constant : verticalMa).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -verticalMa).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func horizontalEqualTo(view : UIView,constant : CGFloat = 0){
        trailingAnchor.constraint(equalTo: view.trailingAnchor,constant : -constant).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor,constant : constant).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func verticalEqualTo(view : UIView,constant : CGFloat = 0){
        topAnchor.constraint(equalTo: view.topAnchor,constant : constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -constant).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setGradeint(gradientColors :[CGColor] ,angle : Float,corner : CGFloat){
        
        let  gradient = CAGradientLayer()
        
        
        let alpha: Float = angle / 360
        let startPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
            2
        )
        
        let startPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0) / 2)),
            2
        )
        let endPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
            2
        )
        let endPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
            2
        )
        
        gradient.endPoint = CGPoint(x: CGFloat(endPointX),y: CGFloat(endPointY))
        gradient.startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
        
        
        gradient.colors = gradientColors
        gradient.cornerRadius = corner
        gradient.frame = bounds
        layer.addSublayer(gradient)
        
        
        
    }
    
    func enableMovment(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan(sender:)))
        addGestureRecognizer(pan)
    }
    
    
    @objc func pan(sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            
            
            let translation = sender.translation(in: self)
            
            center = CGPoint(x:  center.x + (translation.x),
                             y:  center.y + (translation.y ) )
            
            
            
            sender.setTranslation(CGPoint.zero, in:  superview)
        }else if sender.state == .ended {
            
            
            
            
            UIView.animate(withDuration: 0.30) {
                
                var xPoint : CGFloat = 0
                
                if self.center.x < UIScreen.main.bounds.width / 2{
                    xPoint = ((sender.view?.frame.width)! / 2)
                }else {
                    xPoint =   UIScreen.main.bounds.size.width - ((sender.view?.frame.width)! / 2)
                }
                
                self.center = CGPoint(x: xPoint,
                                      y:  self.center.y )
                self.superview?.layoutIfNeeded()
            }
        }
        
    }
    func setGradient(firstColorGradient : UIColor , secondColorGradient: UIColor) {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [firstColorGradient.cgColor,secondColorGradient.cgColor]
        self.layer.addSublayer(layer)
    }
    func setGradient(firstColorGradient : UIColor , secondColorGradient: UIColor,startPoint : CGPoint , endPoint : CGPoint) {
         let layer = CAGradientLayer()
         layer.frame = self.bounds
         layer.colors = [firstColorGradient.cgColor,secondColorGradient.cgColor]
         layer.startPoint = startPoint
         layer.endPoint = endPoint
         self.layer.addSublayer(layer)
     }
        func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
    
            anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        }
    
        func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
    
            translatesAutoresizingMaskIntoConstraints = false
    
            if let top = top {
                topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
            }
    
            if let bottom = bottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
            }
    
            if let left = left {
                leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
            }
    
            if let right = right {
                rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
            }
    
        }
}
extension UIScrollView {
  
  var isAtBottom: Bool {
    return contentOffset.y >= verticalOffsetForBottom
  }
  
  var verticalOffsetForBottom: CGFloat {
    let scrollViewHeight = bounds.height
    let scrollContentSizeHeight = contentSize.height
    let bottomInset = contentInset.bottom
    let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
    return scrollViewBottomOffset
  }
  
}
