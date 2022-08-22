/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.DateTimeHelper;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Salary;
import model.SalaryManagement;
import model.Staff;
import model.WorkShift;
import model.WorkingTime;

/**
 *
 * @author HUNGLM
 */
public class StaffDBContext extends DBContext {

    public ArrayList<Staff> getStaff(Date begin, Date end) {
        ArrayList<Staff> staffs = new ArrayList<>();
        try {
            String sql = "SELECT s.[sid],s.sname,sl.saname,sl.salary,s.nvname,ISNULL(wt.tid,-1)tid,wt.checkin,wt.checkout, ws.wname ,ws.time_work,\n"
                    + "isnull (sm.advance_salary,0)advance_salary,isnull (sm.bonus_salary,0)bonus_salary,isnull (sm.deduction_salary,0)deduction_salary,\n"
                    + "work_minutes  =  DATEDIFF (  MI , [checkin] , [checkout] ) - ws.time_work*60\n"
                    + "from Salary  sl inner join Salary_management sm\n"
                    + "on sl.said=sm.said inner join Staff s\n"
                    + "on sm.[sid]= s.[sid] \n"
                    + "   LEFT JOIN (SELECT * FROM WorkingTime WHERE\n"
                    + "   	checkin >= ?\n"
                    + "   	AND\n"
                    + "      checkin < ?) wt \n"
                    + "   	ON s.[sid] = wt.[sid] INNER JOIN Work_shift ws\n"
                    + "	ON wt.wid=ws.wid order by s.[sid] ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(begin)));
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.removeTime(end)));
            ResultSet rs = stm.executeQuery();
            Staff curSt= new Staff();
            curSt.setSid(-1);
            while (rs.next()) {
                
                         Salary sl= new Salary();
                    sl.setSalary(rs.getInt("salary"));
                    sl.setSaname(rs.getString("saname"));
                    
                   
                    SalaryManagement sm = new SalaryManagement();
                    sm.setAdvance(rs.getInt("advance_salary"));
                    sm.setBonus(rs.getInt("bonus_salary"));
                    sm.setDeduction(rs.getInt("deduction_salary"));
                    sm.setSalary(sl);
                    curSt.setManagement(sm);
               
                    
                  
                   
                    
                int sid = rs.getInt("sid");
                if (sid != curSt.getSid()) {
                    curSt = new Staff();
                    curSt.setSid(sid);
                    curSt.setNvname(rs.getString("nvname"));
                    curSt.setSname(rs.getString("sname"));
                    curSt.setManagement(sm);
                    curSt.setSalary(sl);
                    staffs.add(curSt);
                }   
                      WorkShift ws = new WorkShift();                             
                    ws.setWname(rs.getString("wname"));
                    ws.setTimeWork(rs.getInt("time_work"));
                int tid = rs.getInt("tid");               
                if (tid != -1) {
                    
                    WorkingTime t = new WorkingTime();    
                    t.setStaff(curSt);
                    t.setTid(tid);
                    t.setCheckin(DateTimeHelper.getDateFrom(rs.getTimestamp("checkin")));
                    t.setCheckout(DateTimeHelper.getDateFrom(rs.getTimestamp("checkout")));    
                 t.setWorkShift(ws);
                    curSt.getWorkingTimes().add(t);    
                                    }
                    
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return staffs;
    }
}
