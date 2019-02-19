using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFroms
{
    public partial class WebForm4 : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            KreirajKuki("theme", ddlTheme.SelectedValue);
        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            KreirajKuki("language", ddlLanguage.SelectedValue);
        }

        protected void ddlRepo_SelectedIndexChanged(object sender, EventArgs e)
        {
            KreirajKuki("repo", ddlRepo.SelectedValue);
        }
        private void KreirajKuki(string naziv, string value)
        {
            HttpCookie kuki = new HttpCookie(naziv);
            kuki.Expires.AddYears(1);
            kuki.Value = value;
            Response.Cookies.Add(kuki);
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}