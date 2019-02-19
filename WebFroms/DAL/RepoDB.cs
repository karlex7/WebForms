using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using WebFroms.Models;

namespace WebFroms.DAL
{
    public class RepoDB : IRepo
    {
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public bool AddPerson(Person p)
        {
            SqlHelper.ExecuteNonQuery(cs, "AddPerson", p.IDPerson.ToString(), p.FirstName, p.Surname, p.Telephone, p.Password, p.Admin, p.CityID);
            foreach (var item in p.Emails)
            {
                SqlHelper.ExecuteNonQuery(cs, "AddEmail", item, p.IDPerson.ToString());
            }
            return true;
        }

        public bool DeletePerson(Guid idPerson)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeletePerson", idPerson.ToString());
            return true;
        }

        public Person GetPerson(Guid idPerosn)
        {
            DataRow row = SqlHelper.ExecuteDataset(cs, "GetPerson", idPerosn.ToString()).Tables[0].Rows[0];

            return new Person
            {
                IDPerson = Guid.Parse(row["IDPerson"].ToString()),
                FirstName = row["FristName"].ToString(),
                Surname = row["Surname"].ToString(),
                Telephone = row["Telephone"].ToString(),
                Password = row["UserPassword"].ToString(),
                Admin = bool.Parse(row["IsAdmin"].ToString()),
                CityID = int.Parse(row["CityID"].ToString()),
                Emails = GetEmails(idPerosn)
            };
        }

        private List<string> GetEmails(Guid idPerosn)
        {
            List<string> emails = new List<string>();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "GetEmails", idPerosn.ToString());
            DataTable tblEmails = ds.Tables[0];

            foreach (DataRow row in tblEmails.Rows)
            {
                emails.Add(row["Email"].ToString());
            }
            return emails;
        }

        public IList<Person> GetPersons()
        {
            IList<Person> persons = new List<Person>();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "GetPersons");
            DataTable tblPersons = ds.Tables[0];

            foreach (DataRow row in tblPersons.Rows)
            {
                Person p = new Person();
                p.IDPerson = Guid.Parse(row["IDPerson"].ToString());
                p.FirstName = row["FristName"].ToString();
                p.Surname = row["Surname"].ToString();
                p.Telephone = row["Telephone"].ToString();
                p.Password = row["UserPassword"].ToString();
                p.Admin = bool.Parse(row["IsAdmin"].ToString());
                p.CityID = int.Parse(row["CityID"].ToString());
                p.Emails = GetEmails(p.IDPerson);
                persons.Add(p);
            }
            return persons;
        }

        public bool UpdatePerson(Person p)
        {
            SqlHelper.ExecuteNonQuery(cs, "UpdatePerson", p.IDPerson.ToString(), p.FirstName, p.Surname, p.Telephone, p.Password, p.Admin, p.CityID);
            foreach (var item in p.Emails)
            {
                SqlHelper.ExecuteNonQuery(cs, "AddEmail",item, p.IDPerson.ToString());
            }
            return true;
        }
    }
}