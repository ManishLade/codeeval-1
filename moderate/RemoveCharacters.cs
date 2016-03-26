using System.IO;
using System.Collections.Generic;
using System;

/// <summary>
/// Write a program which removes specific characters from a string.
/// The first argument is a path to a file. 
/// The file contains the source strings and the characters that need to be scrubbed. 
/// Each source string and characters you need to scrub are delimited by comma. 
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
                var arguments = line.Split(',');
                var output = arguments[0];
                var charsToRemove = arguments[1].Trim().ToCharArray();
                foreach(var c in charsToRemove)
                {
                    output = output.Replace(c.ToString(), "");
                }
                Console.WriteLine(output.Trim());
            }
    }
}
