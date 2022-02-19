//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by Peter on 2022/02/18.
//

import UIKit
import Lottie

class CardDetailViewController: UIViewController {
    var promotionDetail: PromotionDetail?

    @IBOutlet weak var lottiView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = AnimationView(name: "money")
        lottiView.contentMode = .scaleAspectFit
        lottiView.addSubview(animationView)
        animationView.frame = lottiView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let detail = promotionDetail else { return }
        
        titleLabel.text = """
            \(detail.companyName)카드 쓰면 \(detail.amount)만원 드려요
            """
        
        periodLabel.text = detail.period
        conditionLabel.text = detail.condition
        benefitConditionLabel.text = detail.benefitCondition
        benefitDetailLabel.text = detail.benefitDetail
        benefitDateLabel.text = detail.benefitDate
    }
}
