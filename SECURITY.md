# Security Best Practices for this Repository

## 🔐 Sensitive Information Guidelines

This document outlines best practices for handling sensitive information in this repository to prevent accidental exposure of secrets, API keys, tokens, and other credentials.

### Never Commit These Files:
- **Environment Files**: `.env`, `.env.local`, `.env.prod`, `.env.development`, `.env.test`
- **API Keys & Tokens**: API keys, access tokens, refresh tokens, bearer tokens, OAuth tokens
- **Database Credentials**: Database passwords, connection strings
- **SSH/Security Keys**: Private keys (id_rsa, id_dsa, id_ed25519), PEM files, P12 certificates
- **Cloud Credentials**: AWS credentials, Google Cloud credentials, Azure credentials
- **Authentication Files**: `credentials.json`, `secrets.json`, `google-services.json`, `firebase.json`
- **Session Data**: Session tokens, cookies, temporary authentication data

### Files That Are Protected by .gitignore:
The following patterns are already configured in `.gitignore` files to prevent accidental commits:

```
# Environments
.env
.env.local
.env.*.local
.env.prod
.env.development
.env.test

# Keys and Certificates
*.key
*.pem
*.pub
*.p12
*.pfx
*.jks

# Credentials
credentials.json
secrets.json
.aws/
.gcp/
google-services.json
firebase.json

# SSH Keys
id_rsa
id_dsa
id_ed25519
*.ppk
```

## 🔑 How to Manage Secrets Safely

### 1. **Use Environment Variables**
Store all secrets in environment variables instead of hardcoding them:

```python
import os
from dotenv import load_dotenv

# Load from .env file (which is in .gitignore)
load_dotenv()

api_key = os.getenv('API_KEY')
database_url = os.getenv('DATABASE_URL')
```

### 2. **Create a .env.example File**
Create a template file showing what environment variables are needed (WITHOUT actual values):

```
# .env.example
API_KEY=your_api_key_here
API_SECRET=your_secret_here
DATABASE_URL=your_database_url_here
AWS_ACCESS_KEY_ID=your_aws_key_here
```

### 3. **Use Configuration Management Tools**
For production deployments, use:
- **Streamlit Secrets**: Store secrets in `.streamlit/secrets.toml` (local only)
- **HuggingFace Spaces Secrets**: Use the Spaces interface for environment variables
- **GitHub Secrets**: For CI/CD pipelines
- **Cloud Provider Secrets**: AWS Secrets Manager, Google Cloud Secret Manager, etc.

### 4. **Generate New Tokens/Keys if Exposed**
If you accidentally commit secrets:
1. **Immediately revoke** the exposed credentials
2. **Generate new** credentials
3. **Use git-filter-repo** to remove the file from git history
4. **Force push** (if safe to do so in your repo)

```bash
# Install git-filter-repo (if not already installed)
pip install git-filter-repo

# Remove a file from all git history
git filter-repo --invert-paths --path path/to/secret-file

# Force push (be careful!)
git push origin --force-with-lease --all
```

## 📋 Checklist Before Committing

Before pushing code:
- [ ] No `.env` files in commit
- [ ] No hardcoded API keys or tokens
- [ ] No private keys or certificates
- [ ] No database passwords
- [ ] No AWS/GCP/Azure credentials
- [ ] All secrets use environment variables
- [ ] `.gitignore` is properly configured
- [ ] Sensitive files are listed in `.gitignore`

## 🔍 Scanning for Secrets

Use these tools to automatically detect secrets before committing:

### git-secrets
```bash
# Install
brew install git-secrets

# Configure for your repo
git secrets --install

# Scan for secrets
git secrets --scan
```

### pre-commit with detect-secrets
```bash
# Install
pip install pre-commit detect-secrets

# Create .pre-commit-config.yaml
# And run: pre-commit install
```

## 📝 Environment Variables Used in This Project

The following environment variables may be needed depending on features used:

- `STREAMLIT_SERVER_HEADLESS` - Streamlit server configuration
- `API_KEY` - For any external API integrations
- `DATABASE_URL` - For database connections
- `AWS_ACCESS_KEY_ID` - For AWS S3 or other AWS services
- `AWS_SECRET_ACCESS_KEY` - AWS secret key
- `HUGGINGFACE_TOKEN` - For HuggingFace model hub access
- `ANTHROPIC_API_KEY` - For Claude API (if used)

## 🚨 If You Accidentally Committed Secrets

1. **Immediately revoke** the exposed credentials in their respective platforms
2. **Generate new** credentials
3. **Remove from git history** using git-filter-repo (see instructions above)
4. **Update** all references to the old credentials
5. **Notify** team members if this is a shared repository
6. **Test** that new credentials work properly

## 📚 Additional Resources

- [OWASP: Secrets Management](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [GitHub: Keeping secrets safe](https://docs.github.com/en/code-security/secret-scanning)
- [Streamlit: Manage App Secrets](https://docs.streamlit.io/streamlit-community-cloud/deploy-your-app/secrets-management)
- [Python-dotenv Documentation](https://github.com/theskumar/python-dotenv)

---

**Last Updated**: January 2026
**Status**: ✅ Repository scanned and secured
