//
//  AttendanceTabMemberView.swift
//  
//
//  Created by Masateru Maegawa on 2020/12/05.
//

import Foundation
import XLPagerTabStrip  //インポートして

class AttendanceTabMemberViewController: UIViewController, IndicatorInfoProvider {    // 「IndicatorInfoProvider」を追加
    
    // タブのタイトルを設定
    var itemInfo: IndicatorInfo = "メンバー"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
