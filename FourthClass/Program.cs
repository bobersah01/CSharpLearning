namespace FourthClass
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Normalde bu değerlerin kullanıcı tarafından girilmesi gerekiyor. En azından arrayler tanımlandıktan sonra, içerlerine eklemeleri loop içerisinde yapılabilir.
            int[] nums1 = { 1, 2, 3, 0, 0, 0 };
            int[] nums2 = { 2, 5, 6};
            int m = nums1.Length;
            int n = nums2.Length;

            Console.WriteLine("First Array: ");
            foreach (int i in nums1)
            {
                Console.WriteLine(i);
            }

            Console.WriteLine("\nSecond Array: ");
            foreach (int i in nums2)
            {
                Console.WriteLine(i);
            }

            int[] nums3 = new int[m + n]; //Toplam Array

            for (int i = 0; i< m;i++)
            {
                nums3[i] = nums1[i];
            }

            int counter = 0;
            for (int i = m; i<m+n;i++)
            {
                nums3[i] = nums2[counter];
                counter++;
            }

            int zeroCounter = 0;
            Console.WriteLine("\nTotal Array: ");
            foreach (int i in nums3)
            {
                Console.WriteLine(i);
                if (i == 0)
                {
                    zeroCounter++;
                }
            }

            int[] nonZeroTotalArray = new int[nums3.Length - zeroCounter];
            for (int i = 0;i< nonZeroTotalArray.Length;i++)
            {
                if (nums3[i] != 0)
                {
                    nonZeroTotalArray[i] = nums3[i];
                }
            }

            Console.WriteLine("\nTotal Array Without Zero: ");
            foreach (int i in nonZeroTotalArray)
            {
                Console.WriteLine(i);
            }

        }
    }
}

