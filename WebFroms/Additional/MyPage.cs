using System;
using System.Threading;
using System.Web;
using WebFroms.BLL;

namespace WebFroms
{
    public class MyPage:System.Web.UI.Page
    {
        public Handler handler = new Handler();
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (Request.Cookies["theme"]!=null)
            {
                var theme = Request.Cookies["theme"].Value;
                Theme = theme;
            }
        }

        public static int ChangeDB()
        {
            if (HttpContext.Current.Request.Cookies["repo"]!=null && HttpContext.Current.Request.Cookies["repo"].Value!="0")
            {
                int db = int.Parse(HttpContext.Current.Request.Cookies["repo"].Value);
                if (db==2)
                    return 2;
                else
                    return 1;
            }
            else
                return 1;
        }
        protected override void InitializeCulture()
        {
            base.InitializeCulture();
            if (Request.Cookies["language"]!=null)
            {
                var language = Request.Cookies["language"].Value;
                if (language!="0")
                {
                    Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(language);
                    Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(language);
                }
            }
        }
    }
}