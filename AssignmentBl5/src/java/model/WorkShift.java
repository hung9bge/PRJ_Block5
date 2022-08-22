/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HUNGLM
 */
public class WorkShift {
    private int wid;
    private String wname;
    private int TimeWork;
    private WorkingTime workingTime;

    public WorkingTime getWorkingTime() {
        return workingTime;
    }

    public void setWorkingTime(WorkingTime workingTime) {
        this.workingTime = workingTime;
    }
    
    

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getWname() {
     
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public int getTimeWork() {
        return TimeWork;
    }

    public void setTimeWork(int TimeWork) {
        this.TimeWork = TimeWork;
    }
    
    
}
