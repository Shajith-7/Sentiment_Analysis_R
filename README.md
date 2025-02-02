
# 🎭 Sentiment Analysis of College Community Reflections using R

## 📖 Overview
This project explores sentiments and perceptions of life within a college community, focusing on the attitudes of students and staff. The dataset was collected via a Google Form survey, and **R programming** was used for **text preprocessing, sentiment classification, and visualization**.

The project applies **Natural Language Processing (NLP)** techniques to analyze responses and classify sentiments as **positive, negative, or neutral**.

---

## 🛠️ Tech Stack
- **Language:** R
- **Libraries Used:** `tm`, `wordcloud`, `syuzhet`, `ggplot2`
- **Dataset:** Google Form survey responses

---

## 📊 Methodology

## 1️⃣ Data Collection
The dataset was created from a Google Form survey where students and staff reflected on life.
Responses were collected in text format for Natural Language Processing (NLP) analysis.
## 2️⃣ Data Preprocessing
Tokenization: Splitting text into words.
Stopword Removal: Removing common words like "the", "is", "and".
Punctuation Elimination: Removing unnecessary symbols to clean the text.
## 3️⃣ Sentiment Analysis
The syuzhet package was used to classify words as positive, negative, or neutral.
A sentiment score was calculated for each response to determine overall sentiment trends.
## 4️⃣ Data Visualization
WordCloud: Displays the most frequently used words in the dataset.
Pie Chart: Shows the overall distribution of sentiments.


## 📊 Results

## WordCloud Output
📌 A visualization of frequently used words in the dataset.

![Screenshot 2024-10-28 233350](https://github.com/user-attachments/assets/36b2421d-6306-4878-9f7c-ae42849ba4ba)


![Screenshot 2024-10-28 233407](https://github.com/user-attachments/assets/5c7be830-c7bc-46ed-bd40-505fa124effe)



## Sentiment Distribution
📊 Pie chart showing the proportion of positive, negative, and neutral sentiments.

![Screenshot 2024-10-28 234409](https://github.com/user-attachments/assets/e687ad44-b4b8-4df7-9630-6f93a46a7201)



## 🚀 Future Improvements
✅ Expand the dataset to include more diverse responses.
✅ Implement machine learning models for more accurate sentiment classification.
✅ Conduct a comparative analysis over different time periods.



## 📜 License
This project is licensed under the MIT License. See the LICENSE file for more details.



