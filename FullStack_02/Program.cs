namespace FullStack_02
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Dynamic declaration.
            int firstNumber = 16;
            int secondNumber = 20;
            int thirdNumber = 30;
            int totalNumber = firstNumber + secondNumber + thirdNumber;
            Console.WriteLine("Toplam: {0}", totalNumber);

            //FullName kullanmayıp sadece name kullanırsak tipi gösterir, geldiği kütüphaneyi göstermez, örneğin system. yazmaz direk INT32 yazar. 
            //Type definitions
            Console.WriteLine("Type of the {0}: {1}", firstNumber, firstNumber.GetType().FullName);
            Console.WriteLine("Type of the {0}: {1}", secondNumber, secondNumber.GetType().FullName);
            Console.WriteLine("Type of the {0}: {1}", thirdNumber, thirdNumber.GetType().FullName);
            Console.WriteLine("Type of the {0}: {1}", totalNumber, totalNumber.GetType().FullName);
            Console.WriteLine("Type of the {0}: {1}", totalNumber, totalNumber.GetType().FullName);

            //Email, UserName, Telephone, Password Controls

            const string userNameConst = "bobersah";
            const string passwordConst = "123987";

            Console.WriteLine("Enter your email: ");
            string userName = Console.ReadLine();
            Console.WriteLine("Enter your password: ");
            string password = Console.ReadLine();

            //All possibilities
            Console.WriteLine(userName == userNameConst && password == passwordConst);
            Console.WriteLine(userName != userNameConst && password == passwordConst);
            Console.WriteLine(userName == userNameConst && password != passwordConst);
            Console.WriteLine(userName != userNameConst && password != passwordConst);
            Console.WriteLine(userName == userNameConst || password == passwordConst);
            Console.WriteLine(userName != userNameConst || password == passwordConst);
            Console.WriteLine(userName == userNameConst || password != passwordConst);
            Console.WriteLine(userName != userNameConst || password != passwordConst);

            
            if (userName == userNameConst && password == passwordConst)
            {
                Console.WriteLine("Entry successful!");
            }
            else if (userName != userNameConst && password == passwordConst)
            {
                Console.WriteLine("Username is not correct!");
            }
            else if (userName == userNameConst && password != passwordConst)
            {
                Console.WriteLine("Password is not correct!");
            }
            else
            {
                Console.WriteLine("Username and password is not correct!");
            }
            
        }
    }
}

