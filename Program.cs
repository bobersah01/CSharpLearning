using System.Numerics;

namespace FirstClass
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*Console.WriteLine("Hello, World!");
            Console.WriteLine("Merhabalar benim adım Ömer!");*/

            //Leet Code 9.Palindrome Number
            //Normalde integer alabiliriz çünkü girilecek olan bir sayının sınırlı 
            //olmasını istiyoruz. Biz şu anda string aldığımız için girilecek olan bir sayının sınırı yok.
            //Belki sayıyı kontrol etme durumumuz olabilir.

            
            Console.WriteLine("Please enter your number for determining whether it is palindrome or not?");
            string palindromeNumber = Console.ReadLine();
            string palindromeControl = "";

            Console.WriteLine("First state of the palindromeControl word: {0}", palindromeControl);

            for (int i = palindromeNumber.Length - 1; i >= 0; i--) 
            {
                //palindromeControl.Append(palindromeNumber[i]);
                palindromeControl += palindromeNumber[i];
            }

            Console.WriteLine("Last state of the palindromeControl word: {0}", palindromeControl);

            if (palindromeNumber == palindromeControl)
            {
                Console.WriteLine("true");
                Console.WriteLine("which means {0} is a palindrome number", palindromeNumber);
            }
            else
            {
                Console.WriteLine("false");
                Console.WriteLine("which means {0} is not a palindrome number", palindromeNumber);
            }
            

            //Practices
            
            string fullName = "Ömer Şahin";
            double weight = 64.6;
            double height = 181.6;
            int birth_year = 1998;
            string city = null; //İçerisinde hiç bir veri taşınmaz.
            string secondCity = ""; //Bellekte yer atanır.*/

            //Control of dividing by 2
           
            Console.WriteLine("Please enter your number for determining whether it is power of 2 or not?");
            string powerOfTwo = Console.ReadLine();
            bool condControl = (Convert.ToInt32(powerOfTwo) % 2 == 0);

            if (Convert.ToInt32(powerOfTwo) == 1 || condControl)
            {
                Console.WriteLine("true");
            }
            else { 
                Console.WriteLine("false");
            }

        }
    }
}
