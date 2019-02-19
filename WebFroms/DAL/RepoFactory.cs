using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFroms.DAL
{
    public static class RepoFactory
    {
        public static IRepo GetRepo(int repoNumber)
        {
            switch (repoNumber)
            {
                case 1:
                    return new RepoDB();
                case 2:
                    return new RepoTXT();
                default:
                    return null;
            }
        }
    }
}