using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFroms.Models
{
    public class Person
    {
        public Guid IDPerson { get; set; }
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string Telephone { get; set; }
        public string  Password { get; set; }
        public bool Admin { get; set; }
        public int CityID { get; set; }
        public List<string> Emails { get; set; }


        public static char DELIMITER = '|';
        public static char DELIMITER_END = '\n';
        public static char DELIMITER_EMAIL = '~';
        public Person()
        {
            IDPerson = Guid.NewGuid();
        }
        public static Person FromFile(string line)
        {
            string[] details = line.Split(DELIMITER);
            Console.WriteLine(details[0]);
            return new Person
            {
                IDPerson = Guid.Parse(details[0]),
                FirstName = details[1],
                Surname = details[2],
                Telephone = details[3],
                Password = details[4],
                Admin = bool.Parse(details[5]),
                CityID = int.Parse(details[6]),
                Emails=EmailsFromFile(details[7])
            };
        }

        public static List<string> EmailsFromFile(string line)
        {
            List<string> emails = new List<string>();
            string[] email = line.Split(DELIMITER_EMAIL);
            foreach (var item in email)
            {
                emails.Add(item);
            }
            return emails;
        }
        public string ToFile()
        {
            return
                $"{IDPerson}{DELIMITER}" +
                $"{FirstName}{DELIMITER}" +
                $"{Surname}{DELIMITER}" +
                $"{Telephone}{DELIMITER}" +
                $"{Password}{DELIMITER}" +
                $"{Admin}{DELIMITER}" +
                $"{CityID}{DELIMITER}" +
                $"{EmailsToFile()}{DELIMITER_END}";
        }

        public string EmailsToFile()
        {
            string s = "";
            foreach (var e in Emails)
            {
                if (e.Trim().Length > 0)
                    s += e + DELIMITER_EMAIL;
            }
            return s;
        }
    }
}