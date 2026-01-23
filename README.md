# Udemy Python Bootcamp - ML Projects Portfolio

A comprehensive collection of **machine learning projects** covering **supervised learning**, **unsupervised learning**, **NLP**, **time-series/finance EDA**, and **deep learning**.

This repository contains both Jupyter notebook projects and an interactive Streamlit web application for exploring and running the projects.

Access the dashboard on Streamlit HuggingFace: https://huggingface.co/spaces/AniD123/ml-projects
(Note: inactivity after 48hr)


---

## 📁 Repository Structure

```text
.
├── notebooks/                         # Classic ML + EDA projects
│   ├── 02-Linear Regression Project.ipynb
│   ├── 02-Logistic Regression Project.ipynb
│   ├── 02-K Nearest Neighbors Project.ipynb
│   ├── 02-Support Vector Machines Project.ipynb
│   ├── 02-Decision Trees and Random Forest Project.ipynb
│   ├── 02-K Means Clustering Project.ipynb
│   ├── 02-NLP Project.ipynb
│   └── 04-Tensorflow Project Exercise.ipynb
├── ml-projects/                       # Alternative organized ML projects folder
│   ├── notebooks/
│   ├── src/
│   ├── streamlit_app.py
│   ├── requirements.txt
│   └── README.md
├── src/                               # Source code
│   └── streamlit_app.py
├── .streamlit/                        # Streamlit configuration
│   └── config.toml
├── app.py                             # Main application entry point
├── streamlit_app.py                   # Streamlit app launcher
├── requirements.txt                   # Python dependencies
├── Dockerfile                         # Docker configuration
├── Procfile                           # Deployment configuration
├── runtime.txt                        # Python runtime version
├── LICENSE                            # MIT License
└── README.md                          # This file
```

---

## 📚 Projects Overview

### Supervised Learning

- **Linear Regression** (Ecommerce Customers)
  - Predict customer spending with linear regression
  - File: `notebooks/02-Linear Regression Project.ipynb`

- **Logistic Regression** (Ad Click Prediction)
  - Binary classification for ad click prediction
  - File: `notebooks/02-Logistic Regression Project.ipynb`

- **K-Nearest Neighbors (KNN)**
  - Classification using distance-based learning
  - File: `notebooks/02-K Nearest Neighbors Project.ipynb`

- **Support Vector Machines (SVM)**
  - Classification with the Iris dataset
  - File: `notebooks/02-Support Vector Machines Project.ipynb`

- **Decision Trees & Random Forests** (LendingClub)
  - Tree-based models for loan default prediction
  - File: `notebooks/02-Decision Trees and Random Forest Project.ipynb`

### Unsupervised Learning

- **K-Means Clustering** (Universities)
  - Unsupervised clustering and customer segmentation
  - File: `notebooks/02-K Means Clustering Project.ipynb`

### Natural Language Processing (NLP)

- **NLP Project** (Yelp Reviews)
  - Text classification: 1-star vs 5-star reviews
  - NLP techniques: vectorization, naive bayes, SVM
  - File: `notebooks/02-NLP Project.ipynb`

### Deep Learning

- **TensorFlow Neural Networks** (Banknote Authentication)
  - Binary classification with neural networks
  - TensorFlow/Keras implementation
  - File: `notebooks/04-Tensorflow Project Exercise.ipynb`

---

## 🚀 Getting Started

### Option 1: Run Streamlit Web App (Recommended)

Interactive web interface to explore and run all notebooks:

```bash
pip install -r requirements.txt
streamlit run streamlit_app.py
```

Then visit `http://localhost:8501` in your browser.

### Option 2: Run Jupyter Notebooks Locally

1. Create a virtual environment:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Launch Jupyter Lab:
   ```bash
   jupyter lab
   ```

4. Open notebooks from the `notebooks/` folder

### Option 3: Google Colab (No Installation Needed)

1. Go to [Google Colab](https://colab.research.google.com/)
2. Upload a notebook or open from GitHub
3. Run cells top-to-bottom

### Option 4: Docker

```bash
docker build -t ml-projects .
docker run -p 8501:8501 ml-projects
```

---

## 💾 Data

Most notebooks include sample datasets or load data from public sources:
- Kaggle datasets (direct download or via API)
- Scikit-learn built-in datasets
- UCI ML Repository

**For custom datasets:**
- Create a `data/` folder: `mkdir data`
- Add `data/` to `.gitignore` to keep repo lightweight
- Update notebook paths: `pd.read_csv('../data/your_file.csv')`

---

## 🌐 Deployment

### Deploy with Streamlit on Hugging Face Spaces (FREE)

Deploy this project as an interactive web app on Hugging Face Spaces—completely free and easy!

**Setup Steps:**

1. Fork or clone this repository to your GitHub account

2. Go to [Hugging Face Spaces](https://huggingface.co/spaces)
   - Click "Create new Space"
   - Choose **Streamlit** as the Space SDK
   - Connect your GitHub repository

3. Hugging Face automatically detects:
   - `requirements.txt` (Python dependencies)
   - `streamlit_app.py` (App entry point)
   - `.streamlit/config.toml` (Streamlit configuration)

4. Your app will be live in minutes at: `https://huggingface.co/spaces/{username}/{space-name}`

**Features:**
- Browse all notebooks from an interactive sidebar
- View markdown cells with proper formatting
- Run and explore code cells
- Clean, responsive web interface

**Note:** Streamlit on Hugging Face Spaces is completely free with no resource limits for small/medium projects.

### Deploy with Render or Railway

Alternative deployment options for container-based hosting:
- Use `Dockerfile` and `Procfile` for containerized deployments
- See deployment provider documentation for setup details

---

## 📋 Requirements & Technologies

**Core Libraries:**
- `pandas` — Data manipulation and analysis
- `numpy` — Numerical computing
- `scikit-learn` — Machine learning algorithms
- `matplotlib` & `seaborn` — Data visualization
- `tensorflow` / `keras` — Deep learning

**Development Tools:**
- `jupyter` — Interactive notebooks
- `streamlit` — Web app framework
- `python 3.8+` — Programming language

See `requirements.txt` for the complete dependency list.

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

---

## ✨ Features

✅ **8+ Machine Learning Projects** covering supervised, unsupervised learning, and NLP  
✅ **Interactive Streamlit Web App** for exploring all projects  
✅ **Jupyter Notebooks** with detailed explanations and visualizations  
✅ **Free Deployment** on Hugging Face Spaces  
✅ **Docker & Container Support** for easy deployment  
✅ **Well-Organized Code** - easy to find and understand  
✅ **MIT Licensed** - use freely in your projects
