using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFroms.BLL;
using WebFroms.Models;

namespace WebFroms.Controls
{
    public partial class EditPerson : System.Web.UI.UserControl
    {
        Handler handler = new Handler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void LoadPersonData(Person p)
        {
            if (!IsPostBack)
            {
                lblId.Text = p.IDPerson.ToString();
                txtName.Text = p.FirstName;
                txtSurname.Text = p.Surname;
                txtEmail.Text = p.Emails.First();
                txtTelephone.Text = p.Telephone;
                txtPassword.Text = p.Password;
                ddlStatus.SelectedValue = p.Admin.ToString();
                LoadCitys();
                ddlCity.SelectedValue = p.CityID.ToString();
            }
        }

        private void LoadCitys()
        {
            ddlCity.Items.Clear();
            foreach (var c in handler.cityHandler.GetCities())
            {
                ddlCity.Items.Add(new ListItem(c.Name, c.IDCity.ToString()));
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Person p = handler.personHandler.GetPerson(Guid.Parse(lblId.Text));
            UpdatePerson(p);
            handler.personHandler.UpdatePerson(p);
        }

        private void UpdatePerson(Person p)
        {
            p.IDPerson = Guid.Parse(lblId.Text);
            p.FirstName = txtName.Text;
            p.Surname = txtSurname.Text;
            p.Telephone = txtTelephone.Text;
            p.Password = txtPassword.Text;
            p.Admin = bool.Parse(ddlStatus.SelectedValue);
            p.CityID = int.Parse(ddlCity.SelectedValue);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(lblId.Text);
            handler.personHandler.DeletePerson(id);
            Response.Redirect("~/List.aspx");
        }
    }
}