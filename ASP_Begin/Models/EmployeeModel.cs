using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Begin.Models
{
    public class EmployeeModel
    {
        public int EmpId{get;set;}
        public string EmpName{get;set;}
        public string Gender{get;set;}
        public string Address{get;set;}
        public string ContactNo{get;set;}
        public int DesignationId{get;set;}
        public int DepartmentId{get;set;}
        public Boolean IsActive{get;set;}
    }
}