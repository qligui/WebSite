using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentWebsite.Admin
{
    public partial class Admintop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkLog_Click(object sender, EventArgs e)
        {
            Session["adminId"] = null;
            Session["adminName"] = null;
            Response.Write("<script language=JavaScript>;parent.location.href='../Default.aspx';</script>");
            Response.End();
        }
    }
}