# Flask Task 1 – Username Uppercase App

## Project Description
This is a simple Flask web application created as part of the **Data Science with Advanced GENAI Internship – Flask Task 1**.

The application accepts a username as a query parameter from the URL, converts it to uppercase, and displays it in the browser.

---

## Features
- Reads `username` from the URL query parameter
- Converts the username to **UPPERCASE**
- Displays the result using an HTML template
- Includes a bonus route for additional string processing

---

## Project Structure
``` text
090126_Flask - Task 1/
│
├── app.py
├── requirements.txt
├── README.md
├── templates/
│ └── index.html
└── venv/
```


---

## Setup Instructions

### 1. Create and activate virtual environment (Windows)
python -m venv venv
venv\Scripts\activate


### 2. Install dependencies
pip install flask
pip freeze > requirements.txt


### 3. Run the application
set FLASK_APP=app.py
flask run


### If port 5000 is unavailable:
flask run --port 5050

---

## Usage :

### Open the browser and visit:
http://127.0.0.1:5000/?username=kishore



### Output: :
KISHORE

---

### other Route
http://127.0.0.1:5000/reverse?username=kishore






