using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP_Begin.Models
{
    public class DesignationModel
    {
        public int DesignationId { get; set; }
        public string DesignationName { get; set; }
        public string Description { get; set; }
        public Boolean IsActive { get; set; }
    }
}