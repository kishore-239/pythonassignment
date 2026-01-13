# Advanced URL Shortener Web Application

This project is an **Advanced URL Shortener Web Application** built using **Flask**, **SQLAlchemy**, and **SQLite**.  
It allows users to create accounts, log in securely, shorten URLs, and access their previously shortened URLs.

The application is designed as an individual project, following clean folder structure and avoiding plagiarism.

---

## 📌 Features

- User Signup & Login (Flask-Login)
- Username validation (5–9 characters, unique)
- Secure password hashing
- URL shortening with unique short codes
- Clickable shortened URLs with redirection
- URLs stored per logged-in user
- SQLite database using SQLAlchemy ORM
- Clean UI using HTML & CSS

---

## 🛠️ Technologies Used

- **Backend:** Python, Flask
- **Authentication:** Flask-Login
- **ORM:** SQLAlchemy
- **Database:** SQLite
- **Frontend:** HTML, CSS
- **Environment:** Python Virtual Environment (venv)

---

## 📁 Project Structure
```

project/
│
├── app/
│ ├── init.py
│ ├── models.py
│ ├── auth_routes.py
│ ├── url_routes.py
│ ├── extensions.py
│ │
│ ├── templates/
│ │ ├── base.html
│ │ ├── home.html
│ │ ├── signup.html
│ │ ├── login.html
│ │ └── dashboard.html
│ │
│ └── static/
│ └── style.css
│
├── instance/
│ └── app.db (auto-generated)
│
├── run.py
├── requirements.txt
└── README.md
```

---

## 🚀 How to Run the Project

### Step 1: Install Dependencies
Make sure Python is installed, then run:

pip install -r requirements.txt


### Step 2: Run the Application
python run.py


## Step 3: Open in Browser
Go to:

http://127.0.0.1:5000/

---

## 🔐 Application Workflow

1. **User opens the home page** and chooses **Signup** or **Login**.
2. **During signup:**
   - Username must be between **5 to 9 characters**
   - Username must be **unique**
3. After **successful login**, the user is redirected to the **dashboard**.
4. User enters a **long URL** and clicks **Shorten**.
5. A **shortened URL** is generated and stored in the database.
6. Clicking the shortened URL **redirects** to the original website.
7. Each user can only see **their own shortened URLs**.
8. User can **logout** securely.

---

## ⚠️ Important Notes

- The database file (`app.db`) is created automatically when the app runs.
- Passwords are securely hashed using Werkzeug.
- No code is copied from reference projects; reference material was used only for conceptual understanding.
- The project is built following individual assignment guidelines.

---

## 📄 Assignment Information

**Project:** Advanced URL Shortener Web Application  
**Backend:** Flask  
**ORM:** SQLAlchemy  
**Database:** SQLite  
**Authentication:** Flask-Login  

**Submission Includes:**
- Working project code
- `requirements.txt`
- `report.pdf`
- `README.md`

---

## 👤 Author

**Krishna Kishore**



