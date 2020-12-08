//
//  AttendanceTabMoneyView.swift
//  
//
//  Created by Masateru Maegawa on 2020/12/05.
//

import Foundation
import XLPagerTabStrip  //インポートして

class AttendanceTabMoneyViewController: UIViewController, IndicatorInfoProvider {    // 「IndicatorInfoProvider」を追加
    
    // タブのタイトルを設定
    var itemInfo: IndicatorInfo = "集金"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
