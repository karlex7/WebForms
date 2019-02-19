using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFroms.Models;

namespace WebFroms
{
    public partial class WebForm1 : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UcitajDDL();
        }

        private void UcitajDDL()
        {
            txtName.Focus();
            foreach (var c in handler.cityHandler.GetCities())
            {
                ddlCity.Items.Add(new ListItem(c.Name, c.IDCity.ToString()));
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Person p = new Person
            {
                FirstName = txtName.Text,
                Surname = txtSurname.Text,
                Telephone = txtTelephone.Text,
                Password = txtPassword1.Text,
                Admin = bool.Parse(ddlStatus.SelectedValue),
                CityID = int.Parse(ddlCity.SelectedValue),
                Emails = new List<string> { txtEmail1.Text }
            };
            handler.personHandler.AddPerson(p);
            ClearText();
        }

        private void ClearText()
        {
            txtName.Text = "";
            txtSurname.Text = "";
            txtTelephone.Text = "";
            txtEmail1.Text = "";
            txtPassword1.Text = "";
            txtPassword2.Text = "";
            txtName.Focus();
        }
    }
}