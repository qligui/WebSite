using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite.Method
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Linkbtn_Click(object sender, EventArgs e)
        {
            Session["是否登录"] = null;
            Session["Username"] = null;
        }
    }
}