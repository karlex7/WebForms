using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebFroms.DAL;

namespace WebFroms.BLL
{
    public class Handler
    {
        public static IRepo repo;

        public PersonHandler personHandler = new PersonHandler();

        public CityHandler cityHandler = new CityHandler();
        public Handler()
        {
            repo = RepoFactory.GetRepo(MyPage.ChangeDB());
        }
        public static IRepo GetRepo()
        {
            return repo;
        }
    }
}