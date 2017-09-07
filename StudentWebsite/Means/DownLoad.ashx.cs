using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace StudentWebsite.Means
{
    /// <summary>
    /// DownLoad 的摘要说明
    /// </summary>
    public class DownLoad : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string filename = "";
            try
            {
                filename = context.Request["FileName"].ToString();
            }
            catch
            {
                context.Response.Write("不正确访问！");
                return;
            }
            string ReadFile = context.Server.MapPath("~/Means/Download/"+filename);//真实存在的文件;
            if(!File.Exists(ReadFile))
            {
                context.Response.Write("服务器上不存在该文件！");
                return;
            }
            context.Response.Buffer = true;
            context.Response.Clear();
            context.Response.ContentType = "application/download";
            string downFile = Path.GetFileName(filename);
            string EncodeFileName = HttpUtility.UrlEncode(downFile,System.Text.Encoding.UTF8);//防止出现中文错乱;
            context.Response.AddHeader("Content-Disposition", "attachment;filename=" + EncodeFileName + ";");//返回文件数据给客户端下载
            context.Response.BinaryWrite(File.ReadAllBytes(ReadFile));
            context.Response.Flush();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}