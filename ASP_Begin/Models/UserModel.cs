using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Begin.Models
{
    public class UserModel
    {
    public int id{get; set;}
    public string UserName { get; set; }
    public string Password { get; set; }
    public int EmployeeId { get; set; }
    public string Role { get; set; }
    public Boolean IsActive { get; set; } 
    }
}