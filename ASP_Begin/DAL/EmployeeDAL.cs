using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASP_Begin.Models;
namespace ASP_Begin.DAL
{
    public class EmployeeDAL:My_Connection
    {
        public string InsertUpdateDeleteEmployee(EmployeeModel Emp,string Action)
        {
            string result = "";
            try
            {
                _initObjects("SP_Employee");
                cmd.Parameters.AddWithValue("@EmpId", Emp.EmpId);
                cmd.Parameters.AddWithValue("@EmpName", Emp.EmpName);
                cmd.Parameters.AddWithValue("@Gender", Emp.Gender);
                cmd.Parameters.AddWithValue("@Address", Emp.Address);
                cmd.Parameters.AddWithValue("@ContactNo", Emp.ContactNo);
                cmd.Parameters.AddWithValue("@DepartmentId", Emp.DepartmentId);
                cmd.Parameters.AddWithValue("@DesignationId", Emp.DesignationId);
                cmd.Parameters.AddWithValue("@IsActive", Emp.IsActive);
                cmd.Parameters.AddWithValue("@Action", Action);
                result = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
            return result;
        }
    }
}