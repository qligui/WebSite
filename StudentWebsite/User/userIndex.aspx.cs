using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite.User
{
    public partial class userIndex1 : System.Web.UI.Page
    {
        T_UserTableAdapter adapter = new T_UserTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                long userId = Convert.ToInt64(Request["id"]);
                if (Request["id"] == null)
                {
                    Response.Redirect("~/Internet/HTML提示登录.htm");
                }
                else
                {
                    ImgPic.ImageUrl = "../User/Image/" + adapter.GetDataByUserId(Convert.ToInt64(Session["UserId"])).Single().Photo;
                    userInfo();
                }
            }
        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            long userId = Convert.ToInt64(Request["id"]);
            adapter.IncUser(txtUser.Text, ddlSex.Text, txtQQ.Text, txtMail.Text, ddlWork.Text, userId);
            userInfo();
        }
        public void userInfo()
        {
            long userId = Convert.ToInt64(Request["id"]);
            T_UserTableAdapter adapter = new T_UserTableAdapter();
            var data = adapter.GetDataByUserId(userId);
            var user = data.Single();
            LabelQQ.Text = user.QQ;
            LabelSex.Text = user.Sex;
            LabelWork.Text = user.Work;
            LabelUser.Text = user.userName;
            LabelEmail.Text = user.Email;
            txtUser.Text = user.userName;
            txtMail.Text = user.Email;
            txtQQ.Text = user.QQ;
        }
    }
}