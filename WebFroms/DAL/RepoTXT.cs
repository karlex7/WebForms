using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using WebFroms.Models;

namespace WebFroms.DAL
{
    public class RepoTXT : IRepo
    {

        public static string TEXT_PATH = System.Web.Hosting.HostingEnvironment.MapPath("~/RepoTXT.txt");
        public RepoTXT()
        {
            CreateIfNotExists();
        }

        private void CreateIfNotExists()
        {
            if (!File.Exists(TEXT_PATH))
            {
                File.Create(TEXT_PATH).Close();
                //Ako ne postoji datoteka moramo dodati jedno usera da bi uopce mogli u aplikaciju
                AddPerson(new Person
                {
                    IDPerson= Guid.Parse("7ea6dc90-6a34-4008-b80d-37767c92fb5f"),
                    FirstName = "Admin",
                    Surname = "Admin",
                    Telephone = "123456789",
                    Password = "123",
                    Admin = true,
                    CityID = 1,
                    Emails = new List<string> { "admin@mail.hr", "admin@mail.com" }
                });

            }
        }

        public bool AddPerson(Person person)
        {
            IList<Person> persons = GetPersons();
            persons.Add(person);
            File.WriteAllLines(TEXT_PATH, persons.Select(p => p.ToFile()));
            return true;
        }

        public bool DeletePerson(Guid idPerson)
        {
            IList<Person> old = GetPersons();
            IList <Person> newList= new List<Person>();
            foreach (var o in old)
            {
                if (o.IDPerson!=idPerson)
                {
                    newList.Add(o);
                }
            }
            File.WriteAllLines(TEXT_PATH, newList.Select(p => p.ToFile()));
            return true;
        }

        public Person GetPerson(Guid idPerosn)
        {
            IList<Person> persons = GetPersons();
            foreach (var p in persons)
            {
                if (p.IDPerson==idPerosn)
                {
                    return p;
                }
            }
            return null;
        }

        public IList<Person> GetPersons()
        {
            IList<Person> persons = new List<Person>();
            IEnumerable<string> lines = File.ReadAllLines(TEXT_PATH);
            foreach (var line in lines)
            {
                if (line.Trim().Length != 0)
                    persons.Add(Person.FromFile(line));
            }
            return persons;
        }

        public bool UpdatePerson(Person p)
        {
            IList<Person> persons = GetPersons();
            for (int i = 0; i < persons.Count; i++)
            {
                if (persons[i].IDPerson == p.IDPerson)
                {
                    persons[i] = p;
                }
            }
            File.WriteAllLines(TEXT_PATH, persons.Select(per => per.ToFile()));
            return true;
        }
    }
}