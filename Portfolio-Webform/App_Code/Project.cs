using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Portfolio_Webform.App_Code
{
    public class Project
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string SourceUrl { get; set; }
        public string TechStack { get; set; }
    }
}