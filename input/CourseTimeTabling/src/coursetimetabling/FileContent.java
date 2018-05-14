/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coursetimetabling;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 *
 * @author UsEr
 */
public class FileContent {

    int MAX_BOUND = 100 ;
    Scanner scan;
    int noDoctors;      //# doctors
    int noClasses;      //# classes
    int noStudents;     //# students
    int noSubjects;     //# subjects
    int noTimes;        //# times
    int[][] DTimes;         // array contains sutalble times for each doctor
    int[][] CTimes;         // array contains sutalble times for each class
    int[][] STimes;         // array contains sutalble times for each students set
    int[][] DSubj;          // array contains doctors are teaching subject (i)
    int[][] SSubj;        // array contains students sets are learning subject (i)
    int[][] CSubj;       // array contains classes that suits subject (i)

    public String DNames[] ; //= {"DrSmith", "Dr.James", "Dr.Walt", "Dr.Marson", "Dr.Sammuel", "Dr.Rejen", "Dr.Watson"};
    public String SNames[]; //= {"Fourth", "SoftWare", "Second", "Group1", "Networks", "First", "Fifth"};
    public String CNames[]; //= {"Central", "MultiMedia", "Netwroks", "Hall2", "Lab3", "Hall9", "Lab1"};
    public String BNames[]; //= {"Graphics", "Compilers", "JAVA2", "Electronics", "Android", "DataBase1", "C++"};
    
    public FileContent() { 
        
     noDoctors = 0 ;      
     noClasses = 0 ;      
     noStudents = 0;    
     noSubjects = 0;     
     noTimes = 1;        
     DTimes = new int[ MAX_BOUND ][ MAX_BOUND ];         
     CTimes = new int[ MAX_BOUND ][ MAX_BOUND ];         
     STimes = new int[ MAX_BOUND ][ MAX_BOUND ];       
     DSubj = new int[ MAX_BOUND ][ MAX_BOUND ];        
     SSubj = new int[ MAX_BOUND ][ MAX_BOUND ];      
     CSubj = new int[ MAX_BOUND ][ MAX_BOUND ];  
     DNames = new String[MAX_BOUND];
     SNames = new String[MAX_BOUND];
     CNames = new String[MAX_BOUND];
     BNames = new String[MAX_BOUND];
        
    }

    public int getNoDoctors() {
        return noDoctors;
    }

    public int getNoClasses() {
        return noClasses;
    }

    public int getNoStudents() {
        return noStudents;
    }

    public int getNoSubjects() {
        return noSubjects;
    }

    public int getNoTimes() {
        return noTimes;
    }

    public int[][] getDTimes() {
        return DTimes;
    }

    public int[][] getCTimes() {
        return CTimes;
    }

    public int[][] getSTimes() {
        return STimes;
    }

    public int[][] getDSubj() {
        return DSubj;
    }

    public int[][] getSSubj() {
        return SSubj;
    }

    public int[][] getCSubj() {
        return CSubj;
    }

    public void setNoDoctors(int noDoctors) {
        this.noDoctors = noDoctors;
    }

    public void setNoClasses(int noClasses) {
        this.noClasses = noClasses;
    }

    public void setNoStudents(int noStudents) {
        this.noStudents = noStudents;
    }

    public void setNoSubjects(int noSubjects) {
        this.noSubjects = noSubjects;
    }

    public void setNoTimes(int noTimes) {
        this.noTimes = noTimes;
    }

//===================================================================================
    public void FillParameters(File input) {    
        
        if ( setFile(input) ) {

            noTimes = scan.nextInt();

            noDoctors = scan.nextInt();
            DTimes = new int[MAX_BOUND][MAX_BOUND + 1];
            addSuitableTimes(DTimes, noDoctors);

            noStudents = scan.nextInt();
            STimes = new int[MAX_BOUND][MAX_BOUND + 1];
            addSuitableTimes(STimes, noStudents);

            noClasses = scan.nextInt();
            CTimes = new int[MAX_BOUND][MAX_BOUND + 1];
            addSuitableTimes(CTimes, noClasses);

            noSubjects = scan.nextInt();
            DSubj = new int[MAX_BOUND][MAX_BOUND + 1];        
            SSubj = new int[MAX_BOUND][MAX_BOUND + 1];       
            CSubj = new int[MAX_BOUND][MAX_BOUND + 1];


            addSubjectInfo();
            
            ReadNames();
            
        }

    }

//===================================================================================    
    private boolean setFile(File input) {
        try {
            scan = new Scanner(input);
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

 //===================================================================================
    private void addSuitableTimes(int[][] Times, int n) {

        for (int i = 0; i < n; ++i) {
            Times[ i][ 0] = scan.nextInt();
            for (int j = 1; j <= Times[ i][ 0]; ++j) {
                Times[ i][ j] = scan.nextInt();
            }
        }

    }

    
  //===================================================================================  
    private void addSubjectInfo() {
      
         for (int i = 0; i < noSubjects; ++i) {
            DSubj[ i][ 0] = scan.nextInt();
            for (int j = 1; j <= DSubj[ i][ 0]; ++j) {
                DSubj[ i][ j] = scan.nextInt();
            }
            
             SSubj[ i][ 0] = scan.nextInt();
            for (int j = 1; j <= SSubj[ i][ 0]; ++j) {
                SSubj[ i][ j] = scan.nextInt();
            }
            
             CSubj[ i][ 0] = scan.nextInt();
            for (int j = 1; j <= CSubj[ i][ 0]; ++j) {
                CSubj[ i][ j] = scan.nextInt();
            }
        }
        
    }
    
    private void ReadNames(){
        
        if(!scan.hasNext()) return ;
                  
        for( int i = 0 ; i < noDoctors ; i++ ){
            DNames[i] = scan.next();
        }
        
        for( int i = 0 ; i < noStudents ; i++ ){
            SNames[i] = scan.next();
        }
        
        for( int i = 0 ; i < noClasses ; i++ ){
            CNames[i] = scan.next();
        }
        
        for( int i = 0 ; i < noSubjects ; i++ ){
            BNames[i] = scan.next();
        }
        
    }

}
