using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFroms.BLL;
using WebFroms.Models;

namespace WebFroms
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetRepoLblText();
            CheckUser();
        }

        private void CheckUser()
        {
            if (Session["user"]==null)
            {
                if (Request.Cookies["user"]!=null)
                {
                    Session["user"] = Request.Cookies["user"].Value;
                    SetUserButton();
                }
            }
            else
            {
                SetUserButton();
            }
        }

        private void SetUserButton()
        {
            Handler handler = new Handler();
            string id = Session["user"].ToString();
            Person p = handler.personHandler.GetPerson(Guid.Parse(id));
            MasterMail.Text = p.FirstName + " " + p.Surname;
            SetUserPermission(p);
        }

        protected void MasterLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("~/Login.aspx");
        }
        private void SetRepoLblText()
        {
            if (HttpContext.Current.Request.Cookies["repo"] != null)
            {
                var repo = int.Parse(HttpContext.Current.Request.Cookies["repo"].Value);
                if (repo == 1)
                {
                    lblCurentRepo.Text = "DB";
                }
                else
                    lblCurentRepo.Text = "TXT";
            }
            else
                lblCurentRepo.Text = "DB";
        }
        private void SetUserPermission(Person p)
        {
            if (!p.Admin)
            {
                if (!Request.Url.ToString().Contains("List"))
                {
                    Response.Redirect("~/List.aspx");
                }
            }
        }
    }
}