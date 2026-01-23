# Machine Learning Projects Portfolio

A collection of ML projects (mostly Jupyter notebooks) covering **supervised learning**, **unsupervised learning**, **NLP**, **time-series/finance EDA**, and **deep learning**.

The repo is organized so each project is easy to find, run, and showcase.

---

## Recommended repo structure

```text
.
├── resnet18-cifar10/                  # script-based deep learning project (PyTorch)
├── notebooks/                         # classic ML + EDA notebooks
│   ├── 02-Linear Regression Project.ipynb
│   ├── 02-Logistic Regression Project.ipynb
│   ├── 02-K Nearest Neighbors Project.ipynb
│   ├── 02-Support Vector Machines Project.ipynb
│   ├── 02-Decision Trees and Random Forest Project.ipynb
│   ├── 02-K Means Clustering Project.ipynb
│   ├── 02-NLP Project.ipynb
│   ├── 04-Tensorflow Project Exercise.ipynb
│   └── 04-Finance Project - Solutions-checkpoint.ipynb
├── reports/                           # PDF exports / write-ups
│   ├── 911_Calls.pdf
│   └── Finance_Project.pdf
├── data/                              # datasets (optional; usually gitignored)
├── .gitignore
└── README.md                          # <-- you are here
```

If your files are currently in the repo root, create `notebooks/` and `reports/` and move them:

```bash
mkdir -p notebooks reports
mv *.ipynb notebooks/
mv *.pdf reports/
```

---

## Projects

### Classical Machine Learning (Notebooks)

> Tip: GitHub renders notebooks. These links assume you moved them into `notebooks/`.

- **Linear Regression (Ecommerce Customers)** — regression workflow + model interpretation.
  - Notebook: `notebooks/02-Linear Regression Project.ipynb`

- **Logistic Regression (Ad Click Prediction)** — binary classification + evaluation.
  - Notebook: `notebooks/02-Logistic Regression Project.ipynb`

- **K-Nearest Neighbors (KNN)** — scaling + choosing `k` + classification.
  - Notebook: `notebooks/02-K Nearest Neighbors Project.ipynb`

- **Support Vector Machines (Iris dataset)** — SVM classification + hyperparameter tuning.
  - Notebook: `notebooks/02-Support Vector Machines Project.ipynb`

- **Decision Trees & Random Forests (LendingClub)** — tree-based modeling + model evaluation.
  - Notebook: `notebooks/02-Decision Trees and Random Forest Project.ipynb`

- **K-Means Clustering (Universities)** — unsupervised clustering + interpretation.
  - Notebook: `notebooks/02-K Means Clustering Project.ipynb`

- **NLP (Yelp Reviews)** — text vectorization + classification (1-star vs 5-star).
  - Notebook: `notebooks/02-NLP Project.ipynb`

### EDA / Capstones

- **911 Calls EDA (Kaggle dataset)** — feature engineering on timestamps + visualizations.
  - PDF report: `reports/911_Calls.pdf`

- **Bank Stocks Finance EDA (2006–2016)** — returns, volatility, moving averages, correlations.
  - PDF report: `reports/Finance_Project.pdf`
  - Notebook: `notebooks/04-Finance Project - Solutions-checkpoint.ipynb`

### Deep Learning (TensorFlow)

- **TensorFlow Banknote Authentication** — binary classification with a neural net.
  - Notebook: `notebooks/04-Tensorflow Project Exercise.ipynb`

---

## Getting started

### Option A: Run notebooks in Google Colab (fastest)
1. Open any notebook in `notebooks/`
2. Click **Open in Colab** (or upload to Colab)
3. Run cells top-to-bottom

### Option B: Run locally
Create a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate
```

Install common dependencies (choose what you need):

```bash
pip install numpy pandas matplotlib seaborn scikit-learn jupyter tqdm
```

For deep learning projects:

```bash
# PyTorch + TorchVision (install the correct build for your system)
# then:
pip install torch torchvision

# TensorFlow (optional; depends on your machine)
# pip install tensorflow
```

Launch Jupyter:

```bash
jupyter lab
```

---

## Notes on data

Some notebooks expect local CSVs (e.g., `loan_data.csv`, `advertising.csv`, `yelp.csv`, etc.).

Recommended pattern:
- Put datasets in `data/<project_name>/...`
- Add `data/` to `.gitignore` (keep the repo lightweight)
- In the notebook, update file paths to point to `../data/...`

---

## Deployment with Voila (FREE Options)

This project can be deployed as an interactive web application using [Voila](https://voila.readthedocs.io/). Here are free deployment options:

### Option 1: Render (Recommended)

Render offers a free tier that works great for Voila apps.

1. **Organize notebooks** (if not already done):
   ```bash
   mkdir -p notebooks reports
   mv *.ipynb notebooks/
   ```

2. **Commit and push to GitHub**:
   ```bash
   git add .
   git commit -m "Add Voila deployment configuration"
   git push origin main
   ```

3. **Deploy on Render**:
   - Go to [https://render.com](https://render.com) and sign up (with GitHub)
   - Click "New +" → "Web Service"
   - Select "Deploy an existing repo"
   - Choose your GitHub repository
   - Render will auto-detect `render.yaml` and configure itself
   - Click "Deploy"

4. Your app will be live in a few minutes at your Render dashboard URL

### Option 2: Replit

Fastest option for getting started:

1. Go to [https://replit.com](https://replit.com)
2. Click "Import repository" and paste your GitHub repo URL
3. Click "Run" and Replit will install dependencies
4. In the Shell, run: `voila --port 3000 notebooks/`
5. Your app is live at the Replit URL

### Option 3: Railway

Railway offers a free tier with monthly credits:

1. Go to [https://railway.app](https://railway.app)
2. Sign in with GitHub
3. Click "Create New Project" → "Deploy from GitHub repo"
4. Select your repository
5. Set environment: Python
6. Add start command: `voila --port $PORT --no-browser notebooks/`
7. Deploy

### Test Locally First

Before deploying, test Voila locally:
```bash
pip install -r requirements.txt
voila --port 8866 notebooks/
```
Then visit `http://localhost:8866` in your browser.

### Files Used for Deployment

- `requirements.txt` — Python dependencies (Voila + ML libraries)
- `Procfile` — Process configuration (for Railway/similar services)
- `runtime.txt` — Python version specification

### Notes

- Large notebooks or heavy computations may need optimization
- Render/Railway may put free apps to sleep after inactivity
- For production, consider upgrading to paid tiers or using Streamlit Cloud (also free)

---

## License

MIT (see `LICENSE` in the repo root).
