// SPDX-License-Identifier: MIT
pragma solidity ^0.6.8;
  
contract StructDemo{
  
    struct Employee{
       
      
       int id_no;
       string name;
       string department;
       string designation;
   }
   
   Employee []emps;
  
   
   function AddEmployee(
     int id_no, string memory name, 
     string memory department, 
     string memory designation
   ) public{
       Employee memory e
         =Employee(id_no,
                   name,
                   department,
                   designation);
       emps.push(e);
   }
  
  
   function GetEmployee(
     int id_no
   ) public view returns(
     string memory, 
     string memory, 
     string memory){
       uint i;
       for(i=0;i<emps.length;i++)
       {
           Employee memory e
             =emps[i];
           
           
           if(e.id_no==id_no)
           {
                  return(e.name,
                      e.department,
                      e.designation);
           }
       }
   
     return("Not Found",
            "Not Found",
            "Not Found");
   }
}
