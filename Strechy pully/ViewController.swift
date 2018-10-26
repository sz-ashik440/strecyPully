//
//  ViewController.swift
//  Strechy pully
//
//  Created by sz ashik on 22/9/18.
//  Copyright © 2018 sz ashik. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  let dummyText = """
Lorem ipsum dolor sit amet, nam putent suscipit delicata ea, per et idque animal repudiandae, facer velit recusabo eum id. His ne prima eripuit. Essent inermis menandri eam cu, ei fabulas civibus electram sit. Has ad labores alienum.
  
  Vidisse voluptatum eum ut. Purto aperiam eu nam, pro illud dicam id, eu nostrud quaestio consequat mea. Nobis causae deserunt in vel, placerat reprehendunt sea ut, wisi sapientem est ex. Causae disputationi interpretaris ei sit, facete deleniti expetendis vix in, sed ad quaestio voluptatibus. Quem quando consetetur his ei, tantas minimum nam at, eu quis adipiscing nam. Cum no choro decore.
  
  Eu brute putent omnesque eum, saepe ullamcorper definitionem per ex. Vim ne rebum semper malorum, at usu elit facilis. Nobis fastidii accumsan mea ut, vix eu essent mollis saperet. Te tritani voluptatum vim, accusam hendrerit sententiae pri ad, cum modo postulant ad. Eam et ubique petentium. Utinam animal duo at, nam id utamur legendos adipiscing.
  
  At partiendo disputationi mei. No veri probo deterruisset his, no his aliquid convenire, ius cu paulo graece. Duo putent definitionem te, pri id oportere inciderint, ei magna urbanitas sit. Est dicat velit civibus in, nam eleifend omittantur ei, an mea graeci maiorum feugait. Ei vel vivendo dissentias, iriure instructior id vim.
  
  Est integre deterruisset eu, laoreet molestiae te cum, in vis tota nostro alienum. Numquam fabulas eu usu, vim ei mundi platonem accommodare. Vis laudem tritani maiorum in. Nam epicuri atomorum argumentum at. Id mundi affert pri, populo adipisci te eos. Pri cu ferri delicatissimi, ei sea tantas nostro audire.
"""
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentInsetAdjustmentBehavior = .never
    return scrollView
  }()
  
  private let infoText: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textColor = .white
    return label
  }()
  
  private var imageView: UIImageView = {
    let image = UIImageView()
    image.image = #imageLiteral(resourceName: "clouds.jpg")
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
  }()
  
  private var textContainer = UIView()
  
  let imageContainer: UIView = {
    let view = UIView()
    view.backgroundColor = .gray
    return view
  }()
  
  let mainTextViewContainer: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  private var previousStatusBarHidden = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    scrollView.delegate = self
    infoText.text = dummyText
    
    view.addSubview(scrollView)
    
    scrollView.addSubview(imageContainer)
    scrollView.addSubview(imageView)
    
    scrollView.addSubview(mainTextViewContainer)
    scrollView.addSubview(textContainer)
    
    textContainer.addSubview(infoText)
    
    setupConstraint()
  }
  
  func setupConstraint() {
    // pin scrollview to super view
    scrollView.snp.makeConstraints { (make) in
      make.edges.equalTo(view)
    }
    
    imageContainer.snp.makeConstraints { (make) in
      make.top.equalTo(scrollView)
      make.left.right.equalTo(view)
      make.height.equalTo(imageContainer.snp.width).multipliedBy(0.7)
    }
    
    imageView.snp.makeConstraints { (make) in
      make.left.right.equalTo(imageContainer)
      make.top.equalTo(view).priority(.high)
      make.height.greaterThanOrEqualTo(imageContainer.snp.height).priority(.required)
      make.bottom.equalTo(imageContainer.snp.bottom)
    }
    
    mainTextViewContainer.snp.makeConstraints { (make) in
      make.left.right.equalTo(view)
      make.top.equalTo(textContainer)
      make.bottom.equalTo(view)
    }
    
    textContainer.snp.makeConstraints{ (make) in
      make.top.equalTo(imageContainer.snp.bottom)
      make.left.right.equalTo(view)
      make.bottom.equalTo(scrollView)
    }
    
    infoText.snp.makeConstraints { (make) in
      make.edges.equalTo(textContainer).inset(14)
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    scrollView.scrollIndicatorInsets = view.safeAreaInsets
    scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
  }
}

extension ViewController: UIScrollViewDelegate{
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if previousStatusBarHidden != shouldHideStatusBar {
      UIView.animate(withDuration: 0.2) {
        self.setNeedsStatusBarAppearanceUpdate()
      }
      previousStatusBarHidden = shouldHideStatusBar
    }
  }
  
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }
  
  override var prefersStatusBarHidden: Bool {
    return shouldHideStatusBar
  }
  
  private var shouldHideStatusBar: Bool {
    let frame = textContainer.convert(textContainer.bounds, to: nil)
    return frame.minY < view.safeAreaInsets.top
  }
}

