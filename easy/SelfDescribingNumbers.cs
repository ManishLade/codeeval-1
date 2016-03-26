using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace SelfDescribingNumbers
{
    /// <summary>
    /// A number is a self-describing number when (assuming digit positions are labeled 0 to N-1), 
    /// the digit in each position is equal to the number of times that that digit appears in the number. 
    /// 
    /// The first argument is the pathname to a file which contains test data, one test case per line. 
    /// Each line contains a positive integer.
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            using (StreamReader reader = File.OpenText(args[0]))
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    if (null == line)
                        continue;
                    var integers = line.Select(c => int.Parse(c.ToString()));

                    if (IsSelfDescribing(integers.ToList()))
                    {
                        Console.WriteLine("1");
                    }
                    else
                    {
                        Console.WriteLine("0");
                    }
                    
                }
        }

        private static bool IsSelfDescribing(List<int> integersList)
        {
            for (var index = 0; index < integersList.Count(); index++)
            {
                if (!(IsSelfDescribingInList(index, integersList)))
                    return false;
            }
            return true;
        }

        private static bool IsSelfDescribingInList(int index, List<int> integersList)
        {
            return integersList.Count(i => i == index) == integersList[index];
        }
    }
}
