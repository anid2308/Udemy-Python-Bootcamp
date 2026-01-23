import streamlit as st
import os
import json
import nbformat
from pathlib import Path

st.set_page_config(page_title="ML Projects", layout="wide")

st.title("🤖 Machine Learning Projects Portfolio")
st.markdown("A collection of ML projects covering supervised learning, unsupervised learning, NLP, and deep learning.")

# Get all notebooks
notebooks_dir = Path("notebooks")
notebooks = sorted(notebooks_dir.glob("*.ipynb"))

if not notebooks:
    st.error("No notebooks found in the notebooks/ directory. Please move your .ipynb files there.")
else:
    # Create sidebar with notebook selection
    st.sidebar.header("📚 Projects")
    selected_notebook = st.sidebar.selectbox(
        "Select a project:",
        [nb.stem for nb in notebooks],
        format_func=lambda x: x.replace("02-", "").replace("04-", "")
    )
    
    # Load and display selected notebook
    notebook_path = notebooks_dir / f"{selected_notebook}.ipynb"
    
    try:
        with open(notebook_path, 'r') as f:
            nb = nbformat.read(f, as_version=4)
        
        st.sidebar.success(f"✓ Loaded: {selected_notebook}")
        
        # Display notebook content
        st.subheader(selected_notebook.replace("02-", "").replace("04-", ""))
        
        for cell in nb.cells:
            if cell.cell_type == "markdown":
                st.markdown(cell.source)
            elif cell.cell_type == "code":
                with st.expander("📝 Code", expanded=False):
                    st.code(cell.source, language="python")
            elif cell.cell_type == "raw":
                st.write(cell.source)
    
    except Exception as e:
        st.error(f"Error loading notebook: {e}")

# Footer
st.markdown("---")
st.markdown("""
### About
This portfolio showcases machine learning projects across multiple domains:
- **Classical ML**: Linear/Logistic Regression, KNN, SVM, Decision Trees, Random Forest
- **Unsupervised Learning**: K-Means Clustering
- **NLP**: Natural Language Processing projects
- **Deep Learning**: TensorFlow/Neural Networks, Finance Analysis

All code is available on [GitHub](https://github.com/anid2308/Udemy-Python-Bootcamp).
""")
