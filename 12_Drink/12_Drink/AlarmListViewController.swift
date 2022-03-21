//
//  AlarmListViewController.swift
//  12_Drink
//
//  Created by Peter on 2022/03/21.
//

import UIKit

class AlarmListViewController: UITableViewController {

    var alarms: [Alarm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlarmListCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alarms = alarmList()
    }

    @IBAction func addAlertButtonAction(_ sender: Any) {
        guard let addAlarmVC = storyboard?.instantiateViewController(withIdentifier: "AddAlarmViewController") as? AddAlarmViewController else { return }
        
        addAlarmVC.pickedDate = { [weak self] date in
            guard let self = self else { return }
            
            var alarmList = self.alarmList()
            let newAlert = Alarm(date: date, isOn: true)
            
            alarmList.append(newAlert)
            alarmList.sort { $0.date < $1.date }
            
            self.alarms = alarmList
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alarms), forKey: "alarms")
            
            self.tableView.reloadData()
        }
        
        self.present(addAlarmVC, animated: true)
    }
    
    func alarmList() -> [Alarm] {
        guard let data = UserDefaults.standard.value(forKey: "alarms") as? Data,
              let alarms = try? PropertyListDecoder().decode([Alarm].self, from: data) else { return []}
        return alarms
    }

       
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "물 마실 시간"
        default:
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmListCell", for: indexPath) as? AlertListCell else { return UITableViewCell() }
        
        cell.alertSwitch.isOn = alarms[indexPath.row].isOn
        cell.timeLabel.text = alarms[indexPath.row].time
        cell.meridiemLabel.text = alarms[indexPath.row].meridiem
        cell.alertSwitch.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.alarms.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alarms), forKey: "alarms")
            
            self.tableView.reloadData()
        return
        default:
            break
        }
    }
}
