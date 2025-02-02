install.packages(c("tidytext", "dplyr", "ggplot2", "tm", "wordcloud", "textdata", "tidyverse", "tokenizers", "caret", "sentimentr"))

            #import libraries....................

library(tidytext)
library(dplyr)
library(ggplot2)
library(tm)
library(wordcloud)
library(textdata)
library(tidyverse)
library(tokenizers)
library(caret)
library(sentimentr)



                      #import dataset

setwd("C:/Users/shaji/OneDrive/Documents")
data <- read.csv("Rproject.csv", stringsAsFactors = FALSE)
head(data) # View the first few rows of the dataset
str(data)# View the structure of the dataset
summary(data) # Summary statistics of the dataset
dataset_dimensions <- dim(data)# Dimensions of the dataset
print(dataset_dimensions)  # Output: [number of rows, number of columns]
column_names <- colnames(data)
print(column_names)  # Output: Names of the columns
View(data)# View dataset


  
  
          # Remove unwanted last two columns and check info....
  
data_without_last_two <- data[, -c(ncol(data)-1, ncol(data))]
 dim(data_without_last_two)  # Check dimensions
 colnames(data_without_last_two)  # Check column names
 View(data_without_last_two)  # view dataset without unwanted datas
 
 
 
 
                    #bar chart depertment
 
 # Load the ggplot2 library
 library(ggplot2)
 
 # Create a bar chart for the department column
 department_bar_chart <- ggplot(data = data_without_last_two, aes(x = Department)) +
   geom_bar(fill = "skyblue", color = "black") +
   labs(title = "Distribution of Participants by Department",
        x = "Department",
        y = "Count") +
   theme_minimal()
 
 # Print the bar chart
 print(department_bar_chart)
 

               #Data Preprocessing..................
 
                     # 1.Tokenization...
 install.packages("tokenizers")
library(tokenizers)

 
 # Convert text to lowercase before tokenization
 text_lower <- tolower(data_without_last_two$what.is.life)
 
 # Tokenize text
 tokens <- tokenize_words(text_lower)
 
 
      
                    
      # 2.Removing stopwords........
 
 # Define a function to remove punctuation
 remove_punctuation <- function(text) {
   # Define the pattern for punctuation
   punctuation_pattern <- "[[:punct:]]"
   # Replace punctuation with an empty string
   text_without_punctuation <- gsub(punctuation_pattern, "", text)
   return(text_without_punctuation)
 }
 
 # Apply the function to each token
 clean_tokens <- lapply(tokens, remove_punctuation)
 
 # Convert the list of cleaned tokens back to a character vector
 clean_text <- unlist(clean_tokens)
 
 # View the cleaned text
 print(clean_text)
 
 
 # Remove empty strings
 clean_text <- clean_text[clean_text != ""]
 
 # View the cleaned text
 print(clean_text)
 print(clean_tokens)
 
 
  # 3. Text Corpus Creation  ....
 
 
 # Load required libraries
 library(tm)
 
 # Sample data
 clean_text <- c("The meaning of life encompasses the quality of existence",
                 "Life is an unpredictable journey of experience",
                 "Life is not about being happy itself but about giving what we have to those who don't have it")
 
 # Create a Corpus
 corpus <- Corpus(VectorSource(clean_text))
 
    
 

 
 
               # Data Splitting" or "Train-Test Splitting." 
 
 # Load required library
 library(caret)
 
 # Sample data
 data <- data_without_last_two
 
 # Set seed for reproducibility
 set.seed(123)
 
 # Split data into training and testing sets (70% training, 30% testing)
 train_index <- createDataPartition(data$what.is.life, p = 0.7, list = FALSE)
 train_data <- data[train_index, ]
 test_data <- data[-train_index, ]
 
 
 # Check the structure of the dataset
 str(data_without_last_two)
 
 # View the first few rows of the dataset
 head(data_without_last_two)
 
 
 
 
 
        #sentiment scores.................
 
  library(sentimentr)
 # Perform sentiment analysis on your text data
 sentiment_scores <- sentiment(data_without_last_two$what.is.life)
  # Separate words based on sentiment scores
 positive_words <- subset(sentiment_scores, sentiment > 0)$word
 negative_words <- subset(sentiment_scores, sentiment < 0)$word
 neutral_words <- subset(sentiment_scores, sentiment == 0)$word
 
 


 
 
 
 # Provided list of words
 all_words <- c("The", "meaning", "of", "life", "encompasses", "the", "quality", "of", "existence", "that", "involves", "being", "alive", "", "experiencing", "growth", "", "connections", "", "purpose", "", "and", "fulfillment", "", "To", "explore", "the", "world", "", "Life", "is", "an", "unpredictable", "", "It", "is", "the", "journey", "of", "experience", "Life", "is", "not", "about", "being", "happy", "in", "itself", "", "but", "about", "giving", "what", "we", "have", "to", "those", "who", "dont", "have", "it", "", "Life", "is", "positive", "or", "negative", "in", "future", "journey", "Life", "is", "like", "a", "diamond", "use", "it", "before", "it", "got", "by", "another", "one", "Fight", "alone", "", "survive", "as", "an", "evil", "", "In", "my", "perspective", "", "life", "is", "about", "fulfilling", "our", "basic", "needs", "", "meeting", "the", "needs", "of", "others", "depending", "on", "us", "", "and", "achieving", "our", "goals", "", "LIFE", "IS", "NOT", "JUST", "A", "FOUR", "WORDS", "", "ITS", "FULL", "OF", "EMOTIONS", "", "LOVE", "", "UNDERSTANDING", "", "SUCCESS", "", "FAILURE", "", "ACHIEVEMENTS", "", "SORROWS", "ETC", "", "", "", "", "SO", "JUST", "LIVE", "THE", "LIFE", "", "Life", "is", "a", "journey", "of", "experience", "and", "living", "with", "love", "to", "survive", "the", "world", "", "Life", "is", "beautiful", "Life", "is", "a", "experience", "My", "life", "full", "damage", "Haushshsjaususi", "in", "w", "s", "da", "se", "b", "ho", "e", "Its", "a", "predefined", "destiny", "which", "we", "need", "to", "enjoy", "and", "live", "every", "moment", "A", "journey", "Experiences", "and", "Attachments", "To", "find", "the", "purpose", "and", "to", "work", "for", "it", "is", "life", "Life", "is", "full", "of", "adventure", "place", "for", "knowing", "each", "other", "Life", "is", "a", "game", "with", "full", "of", "fantasies", "and", "mysteries", "Based", "on", "your", "dreamur", "life", "is", "determined", "", "To", "achieve", "something", "and", "enjoy", "every", "movements", "Life", "is", "something", "that", "is", "good", "for", "bad", "and", "bad", "for", "good", "Life", "is", "a", "journey", "of", "experiences", "", "growth", "", "and", "connections", "", "Life", "is", "gods", "gift", "Life", "is", "the", "ongoing", "experience", "of", "existence", "characterized", "by", "growth", "", "consciousness", "", "and", "the", "pursuit", "of", "purpose", "and", "meaning", "", "Life", "is", "nothing", "Survival", "Life", "is", "a", "journey", "of", "experience", "", "Life", "is", "a", "journey", "A", "long", "journey", "Life", "is", "a", "Ecosystem", "", "love", "", "sad", "", "happiness", "and", "lot", "of", "everything", "", "So", "", "happy", "and", "sad", "are", "cover", "of", "life", "", "Life", "has", "up", "and", "downs", "Life", "is", "short", "for", "good", "peoples", "", "Life", "is", "a", "nothing", "It", "is", "a", "testing", "place", "", "", "Do", "or", "die", "It", "is", "full", "of", "amusement")
 
 # Define positive and negative words
 positive_words <- c("beautiful", "enjoy", "happy", "love", "success", "adventure")
 negative_words <- c("unpredictable", "failure", "sad", "damage", "survival", "testing")
 
 # Filter positive words
 positive_words_in_text <- all_words[all_words %in% positive_words]
 
 # Filter negative words
 negative_words_in_text <- all_words[all_words %in% negative_words]
 
 # Print positive words
 print("Positive words:")
 print(positive_words_in_text)
 
 # Print negative words
 print("Negative words:")
 print(negative_words_in_text)
 
 
 
 
 
 
 
                       # positive words using wordcloud
 
 
 # Load required library
 library(wordcloud)
 
 # Define positive and negative words
 positive_words <- c("beautiful", "enjoy", "happy", "love", "success", "adventure")
 
 # Filter positive words
 positive_words_in_text <- all_words[all_words %in% positive_words]
 
 # Generate word cloud for positive words with red-black color scheme
 if (length(positive_words_in_text) > 0) {
   wordcloud(positive_words_in_text, max.words = 100, scale = c(5, 0.5), colors = c("orange", "black"), main = "Positive Words")
 } else {
   print("No positive words found.")
 }
 
 
                # negative words using wordcloud
 
 # Load required library
 library(wordcloud)
 
 # Define positive and negative words
 negative_words <- c("unpredictable", "failure", "sad", "damage", "survival", "testing")
 
 # Filter negative words
 negative_words_in_text <- all_words[all_words %in% negative_words]
 
 # Generate word cloud for negative words with green-black color scheme
 if (length(negative_words_in_text) > 0) {
   wordcloud(negative_words_in_text, max.words = 100, scale = c(5, 0.5), colors = c("green", "black"), main = "Negative Words")
 } else {
   print("No negative words found.")
 }
 
 
 
 
 
 
 
 
 
 
 # Convert the sentiment scores into a dataframe for easier manipulation
 sentiment_df <- data.frame(
   Document = seq(1, length(sentiment_scores), by = 5),
   Sentence = seq(2, length(sentiment_scores), by = 5),
   Sentiment_Label = seq(3, length(sentiment_scores), by = 5),
   Sentiment_Score = seq(4, length(sentiment_scores), by = 5)
 )
 
 # Define column names
 colnames(sentiment_df) <- c("Document", "Sentence", "Sentiment_Label", "Sentiment_Score")
 
 # Display the dataframe
 print(sentiment_df)
 
 
 
            # sentiment scores for dataset..................
 
 
 library(sentimentr)
 
 # Perform sentiment analysis on your text data
 sentiment_scores <- sentiment(data_without_last_two$what.is.life)
 
 # Filter sentiment scores for positive, negative, and neutral words
 positive_scores <- subset(sentiment_scores, sentiment > 0)
 negative_scores <- subset(sentiment_scores, sentiment < 0)
 neutral_scores <- subset(sentiment_scores, sentiment == 0)
 
 # Output scores
 print("Positive word scores:")
 print(positive_scores)
 
 print("Negative word scores:")
 print(negative_scores)
 
 print("Neutral word scores:")
 print(neutral_scores)
 
 
 
 
 
              # pie chart for sentiment scores........
 
 
 # Combine positive, negative, and neutral counts
 sentiment_counts <- c(Positive = nrow(positive_scores), Negative = nrow(negative_scores), Neutral = nrow(neutral_scores))
 
 # Define colors for each sentiment
 colors <- c("green", "red", "blue")
 
 # Create a pie chart with custom colors, percentages, and labels
 pie(sentiment_counts,
     labels = paste0(names(sentiment_counts), ": ", round(100 * sentiment_counts / sum(sentiment_counts), 1), "%"),
     main = "Distribution of Sentiment Scores",
     col = colors)
 
 legend("topright", names(sentiment_counts), fill = colors)
 
 
 
 
 
                  # print the output(positive or negative )
 
 library(sentimentr)
 # Perform sentiment analysis on your text data
 sentiment_scores <- sentiment(data_without_last_two$what.is.life)
  # Count the number of positive, negative, and neutral words
 positive_count <- sum(sentiment_scores$sentiment > 0)
 negative_count <- sum(sentiment_scores$sentiment < 0)
 neutral_count <- sum(sentiment_scores$sentiment == 0)
  # Determine sentiment
 if (positive_count > negative_count) {
   sentiment <- "Positive"
 } else if (negative_count > positive_count) {
   sentiment <- "Negative"
 } else {
   sentiment <- "Neutral"
 }
 # Output sentiment
 print(paste("Sentiment of the data is:", sentiment))
 
 
 
 
