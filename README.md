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

### Deep Learning

**ResNet-18 on CIFAR-10 (PyTorch)**
- What: Train a ResNet-18 classifier on CIFAR-10, with optional model compression.
- Includes: baseline training, evaluation, TorchScript export, CPU benchmarking, **INT8 PTQ (FX)**, **structured pruning + fine-tuning**.
- Folder: `resnet18-cifar10/`
- Start here: `resnet18-cifar10/README.md`

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

## License

MIT (see `LICENSE` in the repo root).
