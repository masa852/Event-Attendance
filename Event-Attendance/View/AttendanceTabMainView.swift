//
//  AttendanceTabMainView.swift
//  
//
//  Created by Masateru Maegawa on 2020/12/05.
//

import UIKit
import XLPagerTabStrip

class RedViewController: UIViewController, IndicatorInfoProvider {    // 「IndicatorInfoProvider」を追加
    
    // タブのタイトルを設定
    var itemInfo: IndicatorInfo = "出欠"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
