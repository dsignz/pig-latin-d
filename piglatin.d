
// Import for stdin/out access
import std.stdio;

// A class to hold piglatin string
class PigLatinString {
    // Holds the piglatin string
    char[] value;

    this() {
    }

    // constructor to create piglatin string from input array
    //  expected: a single word.
    //  Since the program is designed to take input only from 
    //  command line arguments, this constructor would work
    //  changes needed accept multiple words, sentences etc.
    this(char[] input) {
        int i;
        
        // Iterate through each character 
        while (i < input.length) {
            // If it is a vowel, 
            //   - and it is a one letter word processing ends here.
            //   - else, further processing after exit from loop
            if (input[i] == 'a' || input[i] == 'e' ||
                input[i] == 'i' || input[i] == 'o' ||
                input[i] == 'u' || input[i] == 'U' ||
                input[i] == 'A' || input[i] == 'E' ||
                input[i] == 'I' || input[i] == 'O' )
                {
                    if (input.length == 1) {
                        this.value = input ~ "yay";
                    }
                    break;
                }

            // Loop until there is a vowel
            else i++;
        }

        // For a word starting with a vowel, add "yay" at the end
        if (i == 0 && input.length != 1) {
            this.value = input ~ "yay";
        }
        // else, use string slices to pick the consonent substring till 
        //   the first vowel, remove it from the beginning and 
        //   attach this to the string at the end,
        //   and add "ay".
        else if (input.length > 1) {
            this.value = input [i..$] ~ input[0..i] ~ "ay";
        }
        // case where the full word is a consonent string
        else {
            this.value = input ~ "ay";
        }
    }

    // a get function wrapper to access the value
    char[] get() {return value; }
};

void main(char[][] argc) {
    // Declare variable for array.
    PigLatinString[] array;
    
    // Iterator i, and skipFirst to skip the first argument
    //   because the first argument (in mac, bash) is 
    //   the name of the program itself
    int i, skipFirst;
    
    if (argc.length == 1) {
        writeln ("Please run with some arguments, only alphabet strings.");
    }
    
    // Setup and build the piglatin array
    array = new PigLatinString[] (argc.length - 1);
    foreach (char[] arg; argc) {
        if (!skipFirst) skipFirst=true;    
        else array[i++] = new PigLatinString(arg);
    }
   
    // Print the array
    foreach (PigLatinString p; array) {
        if (p !is null) write (p.get, " ");
    }
    writeln ("");
}
