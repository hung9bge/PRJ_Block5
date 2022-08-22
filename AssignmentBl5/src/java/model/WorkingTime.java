/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DateTimeHelper;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author HUNGLM
 */
public class WorkingTime {
    private int tid;
    private Staff staff;
   private Date checkin;
    private Date checkout;
  private WorkShift workShift;

    public WorkShift getWorkShift() {
        return workShift;
    }

    public void setWorkShift(WorkShift workShift) {
        this.workShift = workShift;
    }
    
    
     private Date cidate;
     private Date cimonth;
     
       public Date getCimonth() {
        return DateTimeHelper.removeDate(checkin);
    }

    public Date getCidate() {   
        return DateTimeHelper.removeTime(checkin);
    }
 
    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }


       public float getWorkingHours()
    {
        if(checkout != null)
        {
            long diff = Math.abs(checkout.getTime() - checkin.getTime());
            long diffSeconds = diff / 1000 % 60;  
            long diffMinutes = diff / (60 * 1000) % 60; 
            long diffHours = diff / (60 * 60 * 1000);
            return (diffHours*1.0f) +  ((diffMinutes*1.0f) / 60);
        }
        else
            return -1;
        
        
    }
          public int getWorking()
    {
        if(checkout != null)
        {
            long diff = Math.abs(checkout.getTime() - checkin.getTime());
            long diffSeconds = diff / 1000 % 60;  
            long diffMinutes = diff / (60 * 1000) % 60; 
            long diffHours = (diff / (60 * 60 * 1000));    
            int ad=0;
            ad = (int) ( (diffHours*60)+diffMinutes )-(workShift.getTimeWork()*60);
           
            
         return  ad  ;     
                   
        }
        else
            return -1;
   
}
           public String getWork(){
            if(checkout != null){
                  long diff = Math.abs(checkout.getTime() - checkin.getTime());
            long diffSeconds = diff / 1000 % 60;  
            long diffMinutes = diff / (60 * 1000) % 60; 
            long diffHours = (diff / (60 * 60 * 1000));    
            int ad=0;
            ad = (int) ( (diffHours*60)+diffMinutes )-(workShift.getTimeWork()*60);
            
            if(ad==0){
             return null;
            }if(ad>0){
                return "+"+ ad;
            }if(ad<0){
                return ""+ad;
            }
            
            }
        return null;
           }
       
}
