using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebFroms.DAL;
using WebFroms.Models;

namespace WebFroms.BLL
{
    public class PersonHandler : IRepo
    {
        public static IRepo repo;
        public PersonHandler()
        {
            //tu setiram koji repo budem koristil preko MyPage
            repo = Handler.GetRepo();
        }
        public bool AddPerson(Person p)
        {
            return repo.AddPerson(p);
        }

        public bool DeletePerson(Guid idPerson)
        {
            return repo.DeletePerson(idPerson);
        }

        public Person GetPerson(Guid idPerosn)
        {
            return repo.GetPerson(idPerosn);
        }

        public IList<Person> GetPersons()
        {
            return repo.GetPersons();
        }

        public bool UpdatePerson(Person p)
        {
            return repo.UpdatePerson(p);
        }
    }
}