using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Begin.Models
{
    public class DepartmentModel
    {
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string Description { get; set; }
        public Boolean IsActive { get; set; }
    }
}