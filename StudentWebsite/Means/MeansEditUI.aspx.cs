using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace StudentWebsite.Means
{
    public partial class MeansEditUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string action=Request["action"];
                if (action == "addnew")
                {
                    FvMeans.ChangeMode(FormViewMode.Insert);
                }
                else if (action == "edit")
                {
                    FvMeans.ChangeMode(FormViewMode.Edit);
                }
                else
                {
                    throw new Exception("action值不正确"+action);
                }
            }
        }

        protected void FvMeans_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload upload = (FileUpload)FvMeans.FindControl("MeansFileupload");
            if (upload.HasFile)
            {
                string ext = Path.GetExtension(upload.FileName).ToLower(); 
                if (ext == ".zip" || ext == ".rar" || ext == ".docx" || ext == ".doc" || ext == ".xlsx" || ext == ".xls")
                {
                    string filename = DateTime.Now.ToString("yyyyMMddhhmmss") + ext;
                    upload.SaveAs(Server.MapPath("~/Means/Download/" + filename));
                    e.Values["FileName"] = filename;
                    e.Values["DateTime"] = DateTime.Now;
                    double filesize = (double)upload.PostedFile.ContentLength / (1024 * 1024);
                    e.Values["FileSize"] =Convert.ToString(Math.Round(filesize,2)+"M");
                    ClientScript.RegisterStartupScript(GetType(), "message", "alert('文件上传成功！')", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "警告", "alert('文件类型错误，只允许上传.zip,.rar,.doc,.docx,.xls,.xlsx文件')",true);
                    e.Cancel = true;
                    return;
                }
            }
        }

        protected void FvMeans_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload upload = (FileUpload)FvMeans.FindControl("MeansFileupload");
            if (upload.HasFile)
            {
                string ext = Path.GetExtension(upload.FileName).ToLower();
                if (ext == ".zip" || ext == ".rar" || ext == ".docx" || ext == ".doc" || ext == ".xlsx" || ext == ".xls")
                {
                    string filename = DateTime.Now.ToString("yyyyMMddhhmmss") + ext;
                    upload.SaveAs(Server.MapPath("~/Means/Download/" + filename));
                    e.NewValues["FileName"] = filename;
                    e.NewValues["DateTime"] = DateTime.Now;
                    double filesize = (double)upload.PostedFile.ContentLength / (1024 * 1024);//文件大小计算
                    e.NewValues["FileSize"] = (Math.Round(filesize, 2) + "M").ToString();//保留两位小数
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "警告", "alert('文件类型错误，只允许上传.zip,.rar,.doc,.docx,.xls,.xlsx文件')",true);
                    e.Cancel = true;
                    return;
                }
            }
        }

        protected void FvMeans_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("MeansMange.aspx");
        }

        protected void FvMeans_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("MeansMange.aspx");
        }

        protected void FvMeans_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Response.Redirect("NewsMange.aspx");
            }
            else
            {
                return;
            }
        }
    }
}