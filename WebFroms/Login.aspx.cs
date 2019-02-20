using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFroms.Models;

namespace WebFroms
{
    public partial class WebForm6 : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            bool checkBox = chbRemember.Checked;
            var p = handler.loginHandler.LoginInfo(email);
            if (p==null)
            {
                userExists.IsValid = false;
                txtEmail.Text = "";
                txtPassword.Text = "";
            }
            else if (p.Password!= password)
            {
                passwordWrong.IsValid = false;
                txtPassword.Text = "";
            }
            else
            {
                UserLogin(p);
            }
        }
        private void UserLogin(Person p)
        {
            Session["user"] = p.IDPerson;
            if (chbRemember.Checked)
            {
                HttpCookie cookie = new HttpCookie("user")
                {
                    Expires = DateTime.Now.AddYears(1)
                };
                cookie.Value = p.IDPerson.ToString();
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("~/List.aspx");
        }
    }
}