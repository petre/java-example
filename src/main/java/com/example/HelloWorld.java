package com.example;

public class HelloWorld {
    public static String getGreeting() {
        return "Hello World";
    }

    public static void main(String[] args) {
        // Loop indefinitely
        while (true) {
            System.out.println(getGreeting());
            try {
                // Pause execution for 2000 milliseconds (2 seconds)
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                // Handle the case where the thread is interrupted while sleeping
                System.err.println("Thread was interrupted.");
                Thread.currentThread().interrupt(); // Restore the interrupted status
                break; // Exit the loop
            }
        }
    }
}