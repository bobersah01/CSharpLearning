namespace SecondClass
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please enter a number for specfing whether is FizzBuzz or not?");
            string inputNumber = Console.ReadLine();

            //Constant values.
            const string fizz = "Fizz";
            const string buzz = "Buzz";

            //List<string> fizzBuzz = newList<string>(); //Liste kullanırsak, dinamik olarak ekleme yapabiliriz.

            string[] fizzBuzz = new string[15]; //arraye eklemeli halini yapamadım. Out of array hatası alıyorum.

            for (int i = 1; i <= Convert.ToInt32(inputNumber); i++) 
            {
                //Console.Write("{0}.Number: ", i);
                if (i % 3 == 0 && i % 5 == 0)
                {
                    //Console.WriteLine(fizz + buzz);
                    fizzBuzz[i - 1] = fizz + buzz;
                }

                else if (i % 3 == 0)
                {
                    //Console.WriteLine(fizz);
                    fizzBuzz[i - 1] = fizz;
                }

                else if (i % 5 == 0)
                {
                    //Console.WriteLine(buzz);
                    fizzBuzz[i - 1] = buzz;
                }

                else
                {
                    //Console.WriteLine(i);
                    fizzBuzz[i - 1] = Convert.ToString(i);
                }
            }

            int counter = 0;
            foreach (string s in fizzBuzz)
            {
                Console.Write("{0}.Madde:  ", counter);
                Console.WriteLine(s);
                counter++;
            }
        }
    }
}
