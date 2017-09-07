using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetBBSTableAdapters;

namespace StudentWebsite.BBS
{
    public partial class AddView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["是否登录"]))
            {
                T_BBSTableAdapter adapter = new T_BBSTableAdapter();
                adapter.InsertQuestion(txtTitle.Text, txtMsg.Text, Session["UserName"].ToString(), DateTime.Now, false);
            }
            else
            {
                Response.Redirect("~/Internet/HTML提示登录.htm");
                return;
            }
        }
    }
}