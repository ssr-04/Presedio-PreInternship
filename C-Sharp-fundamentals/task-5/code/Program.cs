using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;

class WordProcessor
{
    static void Main(){

        string inputFilepath = "./shakespeare_sonnet.txt";
        string outputFilePath = "./output.txt";

        try{

            // Read all text from the file
            string content = File.ReadAllText(inputFilepath);

            // Process the content
            int lineCount = File.ReadAllLines(inputFilepath).Length;
            int wordCount = content.Split([' ', '\n', '\r'], StringSplitOptions.RemoveEmptyEntries).Length;
            int charCount = content.Length;

            // Frequent Words
            Dictionary<string, int> frequent = getFrequentWords(content);

            string frequentString = "";

            foreach(KeyValuePair<string, int> kvp in frequent){
                frequentString += $"[{kvp.Key} -> {kvp.Value} times] ";
            }

            // Prepare the result
            string result = $"📄 File Analysis Report\n" +
                            $"------------------------\n" +
                            $"Lines     : {lineCount}\n" +
                            $"Words     : {wordCount}\n" +
                            $"Characters: {charCount}\n" +
                            $"Frequent words: {frequentString}";
            
            // Write to output file
            File.WriteAllText(outputFilePath, result);

            // Also show in console
            Console.WriteLine(result);
            Console.WriteLine($"\n✅ Analysis written to: {outputFilePath}");

        } catch(FileNotFoundException) {
            Console.WriteLine($"Error: File '{inputFilepath}' not found.");

        } catch(IOException ex) {
            Console.WriteLine($"IO Error: {ex.Message}");

        } catch(Exception ex) {
            Console.WriteLine($"Unexpected Error: {ex.Message}");

        }
    }

    static Dictionary<string, int> getFrequentWords(string content){

        // Splits words
        string[] words = content.Split([' ', '\r', '\n', ',', '.', ';', ':', '?', '!'], StringSplitOptions.RemoveEmptyEntries);
        Dictionary<string, int> frequent = new(StringComparer.OrdinalIgnoreCase); //ignores case sensitive when comparing

        foreach(string word in words){
            if(frequent.ContainsKey(word)){
                frequent[word] += 1;
            } else {
                frequent[word] = 1;
            }
        }

        return frequent.OrderByDescending(kvp => kvp.Value).Take(5).ToDictionary(kvp => kvp.Key, kvp => kvp.Value); // Sorting and taking top 5
    }
}