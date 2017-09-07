using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite.User
{
    public partial class ImageUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            T_UserTableAdapter adapter = new T_UserTableAdapter();
            imagePic.ImageUrl = "../User/Image/" + adapter.GetDataByUserId(Convert.ToInt64(Session["UserId"])).Single().Photo;
        }

        protected void BtnImg_Click(object sender, EventArgs e)
        {
            if (FileUpLoadImg.HasFile)
            {
                T_UserTableAdapter adapter = new T_UserTableAdapter();
                /*tolower（）方法将大小写转化为小写*/
                string ext = Path.GetExtension(FileUpLoadImg.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    string filename = DateTime.Now.ToString("yyyyMMddhhmmss") + ext;
                    FileUpLoadImg.SaveAs(Server.MapPath("~/User/Image/" + filename));//不能保证恶意攻击者不会获取管理员的密码，所以还是得校验文件类型名
                    adapter.UpdatePhoto(filename,Convert.ToInt64(Session["UserId"]));
                    DataBind();
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "警告", "alert('文件类型错误，只允许上传.jpg,.jpeg,.png,.gif文件')", true);
                    //注册页面加载的时候执行javascript的脚本，我们用的最多的对话框；第二个参数为页面的唯一名称（保证页面不同名），第四个参数为true为自动添加script标签
                    return;
                }
            }
        }
    }
}