using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace HelloWorld
{

public class HelloWorld
{
    public static void Main(string[] args)
    {
        var participants=new List<TrainingSession>()
        {
            new TrainingSession () {EmpId=1,Name="Subhadeep ", Dept="IT"},
            new TrainingSession () {EmpId=2,Name="pinky ", Dept="HR"},
            new TrainingSession () {EmpId=3,Name="arko ", Dept="Sales"},
            new TrainingSession () {EmpId=4,Name="Sudip ", Dept="Sales"}
            
            
        };
        var depList= from dlst in participants
                     where dlst.Dept =="Sales"
                     select dlst;
        foreach(var item in depList)
        {
            Console.WriteLine(item.EmpId+" -"+item.Name+"--------sales");
        }
        
        
        
    }
}
 public class TrainingSession
    {
        public int EmpId {get;set;}
        public string Name {get;set;}
        public string Dept{get;set;}
        
    }
}