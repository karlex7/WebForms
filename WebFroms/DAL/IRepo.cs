using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebFroms.Models;

namespace WebFroms.DAL
{
    public interface IRepo
    {
        IList<Person> GetPersons();
        Person GetPerson(Guid idPerosn);
        bool AddPerson(Person p);
        bool DeletePerson(Guid idPerson);
        bool UpdatePerson(Person p);
    }
}
