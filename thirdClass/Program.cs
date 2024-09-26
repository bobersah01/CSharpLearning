using System.Collections.Generic; //Liste sınıfı kullanmak için
namespace thirdClass
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*
            List<int> dividerList = new();
            List<int> notDividerList = new();
            
            Console.WriteLine("Please enter a number for determining whether is power of three or not?");
            string number = Console.ReadLine();
            int converterNumber = Convert.ToInt32(number);

            for (int i = 2; i < converterNumber; i++)
            {
                if (converterNumber % i == 0)
                {
                    dividerList.Add(i);
                }
            }

            int counter = 1;
            Console.WriteLine("General Divider List of {0}", number);
            foreach (int i in dividerList)
            {
                Console.Write("{0}.Divider: ", counter);
                Console.WriteLine(i);
                counter++;
            }

            for (int i = 0; i < dividerList.Count; i++)
            {
                if (dividerList[i]%2 == 0 &&  dividerList[i]%3 == 0)
                {
                    dividerList.Remove(dividerList[i]);
                }
                else if (dividerList[i]%2 == 0)
                {
                    dividerList.Remove(dividerList[i]);
                }
                else if (dividerList[i]%5 == 0)
                {
                    dividerList.Remove(dividerList[i]);
                }
                else if (dividerList[i]%7 == 0)
                {
                    dividerList.Remove(dividerList[i]);
                }
            }

            int secondCounter = 1;
            Console.WriteLine("Special Divider list (expect 3's) of {0}", number);
            foreach (int i in dividerList)
            {
                Console.Write("{0}.Divider: ", secondCounter);
                Console.WriteLine(i);
                secondCounter++;
            }
            */

            int[] numbers = {3,0,2,1};
            int lengthOfNumbers = numbers.Length;
            int[] numbersMustBe = new int[lengthOfNumbers];

            for (int i = 0; i < lengthOfNumbers+1; i++)
            {
                numbersMustBe[i] = i;
            }

            Console.WriteLine("Numbers entered from the user: ");
            foreach (int i in numbers)
            {
                Console.WriteLine(i);
            }

            Console.WriteLine("\nNumbers must be in range: ");
            foreach (int i in numbersMustBe)
            {
                Console.WriteLine(i);
            }

        }
    }
}
