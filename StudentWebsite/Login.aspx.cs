using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;
using SEHelper;

namespace StudentWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            /*学生*/
            if (ddlUser.SelectedValue == "学生")
            {
                T_UserTableAdapter adapter = new T_UserTableAdapter();
                var data = adapter.GetDataByUserName(txtUserName.Text);
                if (data.Count <= 0)
                {
                    LabelMsg.Text = "用户名不存在！";
                    LabelMsg.Visible = true;
                }
                else
                {
                    var user = data.Single();
                    if (!user.IsErrorTimesNull() && !user.IsLastErrorTimesNull())
                    {
                        double span = (DateTime.Now - user.LastErrorTimes).TotalMinutes;
                        if (user.ErrorTimes >= 5 && span <= 30)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "警告", "alert('输入错误次数过多，30分钟后重试')", true);
                            return;
                        }
                    }
                    if (user.userPassword == MD5Helper.GetMD5(txtPassWord.Text + "$%1"))
                    {
                        Session["是否登录"] = true;
                        Session["UserId"] = user.userId;
                        Session["UserName"]=user.userName;
                        adapter.ResetErrorTimesById(user.userId);
                        adapter.IncUserIP(Request.UserHostAddress, user.userId);
                        Response.Redirect("~/User/userIndex.aspx?id="+Session["UserId"]);
                    }
                    else
                    {
                        adapter.IncErrorTimesById(user.userId);
                        LabelMsg.Text = "用户名或者密码错误！";
                        LabelMsg.Visible = true;
                    }
                }
            }
                /*教师*/
            else if (ddlUser.SelectedValue == "教师")
            {
                T_TeacherTableAdapter adapter = new T_TeacherTableAdapter();
                var data = adapter.GetDataByTeacherName(txtUserName.Text);
                if (data.Count <= 0)
                {
                    LabelMsg.Text = "用户名不存在!";
                    LabelMsg.Visible = true;
                }
                else
                {
                    var teacher = data.Single();
                    if(!teacher.IsErrorTimesNull()&&!teacher.IsLastErrorTimesNull())
                    {
                        double span = (DateTime.Now - teacher.LastErrorTimes).TotalMinutes;
                        if (teacher.ErrorTimes >= 5 && span <= 30)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "警告", "alert('输入错误次数过多，30分钟后重试')", true);
                            return;
                        }
                    }
                    if (teacher.TeacherPassWord == MD5Helper.GetMD5(txtPassWord.Text + "$%1"))
                    {
                        Session["教师是否登录"] = true;
                        Session["TeacherId"] = teacher.TeacherId;
                        adapter.ResetErrorTimes(teacher.TeacherId);
                        adapter.IncTeacherIP(Request.UserHostAddress, teacher.TeacherId);
                        Response.Redirect("~/Teacher/Theachmain.aspx");
                    }
                    else
                    {
                        adapter.IncErrorTimesById(teacher.TeacherId);
                        LabelMsg.Text = "用户名或者密码错误!";
                        LabelMsg.Visible = true;
                    }
                }
            }
                /*管理员*/
            else
            {
                T_AdminTableAdapter adapter = new T_AdminTableAdapter();
                var data = adapter.GetDataByAdminName(txtUserName.Text);
                if (data.Count <= 0)
                {
                    LabelMsg.Text = "用户名不存在！";
                    LabelMsg.Visible = true;
                }
                else
                {
                    var admin = data.Single();
                    if(!admin.IsErrorTimesNull()&&!admin.IsLastErrorTimesNull())
                    {
                        double span = (DateTime.Now - admin.LastErrorTimes).TotalMinutes;
                        if (admin.ErrorTimes >= 5 && span <= 30)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "警告", "alert('输入错误次数过多，30分钟后重试')", true);
                            return;
                        }
                    }
                    if (admin.AdminPassword == MD5Helper.GetMD5(txtPassWord.Text + "$%1"))
                    {
                        Session["是否登录"] = true;
                        Session["adminId"] = admin.AdminId;
                        Session["adminName"] = admin.AdminName;
                        adapter.ResetErrorTimes(admin.AdminId);
                        adapter.IncAdminIP(Request.UserHostAddress, admin.AdminId);
                        Response.Redirect("~/Admin/main.aspx");
                    }
                    else
                    {
                        adapter.IncErrorTimesById(admin.AdminId);
                        LabelMsg.Text = "用户名或者密码错误！";
                        LabelMsg.Visible = true;
                    }
                }
            }
        }
    }
}