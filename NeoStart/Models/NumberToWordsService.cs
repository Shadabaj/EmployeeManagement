using System;

public class NumberToWordsService
{
    private static string[] ones = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                                     "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen",
                                     "Eighteen", "Nineteen" };

    private static string[] tens = { "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

    private static string[] thousands = { "", "Thousand", "Million", "Billion" };

    public string ConvertToWords(int num)
    {
        if (num == 0)
            return "Zero";

        int thousandIndex = 0;
        string words = "";

        while (num > 0)
        {
            if (num % 1000 != 0)
                words = ConvertHundreds(num % 1000) + thousands[thousandIndex] + " " + words;

            num /= 1000;
            thousandIndex++;
        }

        return words.Trim();
    }

    private string ConvertHundreds(int num)
    {
        string result = "";

        if (num >= 100)
        {
            result += ones[num / 100] + " Hundred ";
            num %= 100;
        }

        if (num >= 20)
        {
            result += tens[num / 10] + " ";
            num %= 10;
        }

        if (num > 0)
        {
            result += ones[num] + " ";
        }

        return result;
    }
}
