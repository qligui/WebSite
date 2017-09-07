using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;
using SEHelper;

namespace StudentWebsite.User
{
    public partial class UserPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    throw new Exception("未找到id的值");
                }
            }
        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            if(!IsValid)
            {
                return;
            }
            long userId=Convert.ToInt64(Session["UserId"]);
            T_UserTableAdapter adapter = new T_UserTableAdapter();
            var data = adapter.GetDataByUserId(Convert.ToInt64(userId));
            var user = data.Single();
            if (MD5Helper.GetMD5(txtLastpwd + "$%1") == user.userPassword)
            {
                adapter.UpdateUserPwd(MD5Helper.GetMD5(txtPwd2.Text+"$%1"),Convert.ToInt64(userId));
            }
            else
            {
                labpwd.Text = "旧密码有误！";
            }
            
        }
    }
}