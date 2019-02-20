using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebFroms.Models;

namespace WebFroms.BLL
{
    public class LoginHandler
    {
        PersonHandler personHandler = new PersonHandler();
        public LoginHandler()
        {

        }
        public Person LoginInfo(string email)
        {
            IList<Person> persons = personHandler.GetPersons();
            foreach (Person person in persons)
            {
                if (person.Emails[0]==email)
                {
                    return person;
                }
            }
            return null;
        }
    }
}