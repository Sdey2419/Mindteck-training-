using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace HelloWorld
{
	public class Program
	{
		public static void Main(string[] args)
		{
			string name="mindteck";
			string rev="";
			for(int i=name.Length-1;i>=0;i--)
			{
			  rev=rev+name[i];
			}
			Console.WriteLine(rev);
		}
	}
}