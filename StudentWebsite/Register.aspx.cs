using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEHelper;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRepter_Click(object sender, EventArgs e)
        {
            if (!IsValid)
            {
                return;
            }
            string code = Convert.ToString(Session["Code"]);
            string codeLower = Convert.ToString(Session["Codelower"]);
            if (txtNumber.Text == code || txtNumber.Text == codeLower)
            {
                T_UserTableAdapter adapter = new T_UserTableAdapter();
                /*插入数据库*/
                string PassWord = MD5Helper.GetMD5(txtPassWord2.Text + "$%1");
                adapter.InsertUserId(txtUserName.Text, PassWord, txtMail.Text);
                Response.Redirect("~/Internet/HTML转向倒计时.htm");
            }
            else
            {
                labelMsg.Text = "验证码错误！";
            }
        }
    }
}