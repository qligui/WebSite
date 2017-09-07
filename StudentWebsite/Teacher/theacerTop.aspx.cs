using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentWebsite.Teacher
{
    public partial class theacerTop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkLog_Click(object sender, EventArgs e)
        {
            Session["TeacherId"] =null;
            Response.Write("<script language=JavaScript>;parent.location.href='../Default.aspx';</script>");
            Response.End();
        }
    }
}