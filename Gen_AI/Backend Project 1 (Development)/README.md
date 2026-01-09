# Regex Matcher – Backend Project 1

## Overview

This project is a **simple Flask web application** that replicates the **core functionality of regex101.com**.

The application allows a user to:
- Enter a **test string**
- Enter a **regular expression**
- View **all matched substrings**
- See a clear error message if the regular expression is invalid

The focus of this project is **backend logic, correctness, and clean structure**, not advanced UI or over-engineering.

This project was completed as part of the  
**Data Science with Advanced GENAI Internship – Backend Project 1 (Development)**  
by **Innomatics Research Labs**.

---

## What This Project Does

- Accepts user input using an HTML form
- Uses Python’s `re.findall()` to extract **all matches**
- Displays matches clearly on the webpage
- Handles invalid regular expressions using proper error handling
- Preserves user input after form submission

---

## What This Project Does NOT Do

- Does not explain regular expressions
- Does not support advanced regex flags
- Does not use JavaScript frameworks
- Does not store data in a database
- Does not attempt to fully clone regex101 UI or features

These decisions were made intentionally to stay within the assignment scope.

---

## Technologies Used

- Python 3
- Flask
- HTML
- CSS
- Python `re` module
- Virtual Environment (`venv`)

---

## Project Folder Structure

``` text

090126_regex-matcher_Backend-Project-1/
│
├── venv/
│
├── app.py
├── requirements.txt
├── README.md
├── .gitignore
│
├── templates/
│ └── index.html
│
└── static/
└── style.css

```


---

## How to Run the Project (Windows)

### Step 1: Open Command Prompt or PowerShell  
Navigate to the project directory:

cd "C:\Users\kishore\OneDrive\Desktop\GenAI__\090126_regex-matcher_Backend Project 1 (Development)"

### Step 2: Create a Virtual Environment
python -m venv venv


### Step 3: Activate the Virtual Environment
venv\Scripts\activate


### Step 4: Install Dependencies
pip install flask


### Step 5: Run the Application
python app.py


### Step 6: Open in Browser
- Open your browser and go to:
http://127.0.0.1:5000/



---


## Example Usage

#### Test String
Hello world 123 hello 456


#### Regular Expression
\d+


#### Output
123
456


---
## Error Handling

- Invalid regular expressions are handled using try-except
- The application does not crash
- A clear error message is displayed to the user

## Key Design Decisions

- Used `re.findall()` instead of `re.match()` to match regex101 behavior
- Used Flask templates and static files following best practices

## Learning Outcomes

- Building a basic Flask application
- Handling user input securely
- Working with Python regular expressions
- Managing dependencies using a virtual environment
- Structuring a backend project cleanly and professionally

## Author

**Krishna Kishore Kudithi**  
Backend Project – Innomatics Research Labs
