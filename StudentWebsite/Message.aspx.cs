using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetMessageTableAdapters;

namespace StudentWebsite
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAnswer_Click(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["是否登录"]))
            {
                string code = Convert.ToString(Session["Code"]);
                string codeLower = Convert.ToString(Session["Codelower"]);
                if (txtYanZhen.Text == code || txtYanZhen.Text == codeLower)
                {
                    T_MessageTableAdapter adapter = new T_MessageTableAdapter();
                    adapter.InsertMessange(Session["UserName"].ToString(), txtMsg.Text, DateTime.Now);
                    ClientScript.RegisterStartupScript(GetType(), "提示", "alert('留言成功！')", true);
                    Session["已经留言"] = true;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    LabError.Text = "验证码错误！";
                    return;
                }
            }
            else
            {
                Response.Redirect("~/Internet/HTML提示登录.htm");
                return;
            }
        }
    }
}