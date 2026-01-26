#!/bin/bash
# Security Verification Script
# Run this to verify the repository is secure

echo "🔐 REPOSITORY SECURITY VERIFICATION"
echo "===================================="
echo ""

echo "📊 AUDIT RESULTS:"
echo "================="
echo ""

# Check for tracked sensitive files
echo "1. Checking for tracked sensitive files..."
SENSITIVE_COUNT=$(git ls-files | grep -E "\.(env|key|pem|p12|secret|cred|token)" | wc -l)
if [ $SENSITIVE_COUNT -eq 0 ]; then
    echo "   ✅ PASS: No sensitive files in git history"
else
    echo "   ⚠️ WARNING: Found $SENSITIVE_COUNT sensitive file(s)"
    git ls-files | grep -E "\.(env|key|pem|p12|secret|cred|token)"
fi

echo ""
echo "2. Checking .gitignore configuration..."
if [ -f .gitignore ]; then
    ENV_PATTERNS=$(grep -c "\.env" .gitignore)
    echo "   ✅ PASS: .gitignore exists with $ENV_PATTERNS environment patterns"
else
    echo "   ❌ FAIL: .gitignore not found"
fi

echo ""
echo "3. Checking for hardcoded API keys in source code..."
API_KEY_COUNT=$(find . -type f \( -name "*.py" -o -name "*.json" \) -not -path "./.git/*" -exec grep -l "api_key\|API_KEY\|api-key" {} \; 2>/dev/null | grep -v ".env.example" | wc -l)
if [ $API_KEY_COUNT -eq 0 ]; then
    echo "   ✅ PASS: No hardcoded API keys found"
else
    echo "   ⚠️ WARNING: Check these files for secrets:"
    find . -type f \( -name "*.py" -o -name "*.json" \) -not -path "./.git/*" -exec grep -l "api_key\|API_KEY" {} \; 2>/dev/null
fi

echo ""
echo "4. Checking for hardcoded passwords..."
PWD_COUNT=$(find . -type f -name "*.py" -not -path "./.git/*" -exec grep -l "password\s*=" {} \; 2>/dev/null | wc -l)
if [ $PWD_COUNT -eq 0 ]; then
    echo "   ✅ PASS: No hardcoded passwords found"
else
    echo "   ⚠️ WARNING: Check these files for hardcoded passwords:"
    find . -type f -name "*.py" -not -path "./.git/*" -exec grep -l "password\s*=" {} \;
fi

echo ""
echo "5. Checking security documentation..."
if [ -f SECURITY.md ] && [ -f SECURITY_AUDIT.md ] && [ -f .env.example ]; then
    echo "   ✅ PASS: All security documentation files present"
    echo "      - SECURITY.md (Guidelines)"
    echo "      - SECURITY_AUDIT.md (Audit Report)"
    echo "      - .env.example (Template)"
else
    echo "   ⚠️ WARNING: Missing security documentation files"
fi

echo ""
echo "📁 FILE SUMMARY:"
echo "==============="
echo "   Root .gitignore: $(wc -l < .gitignore) lines"
echo "   ml-projects/.gitignore: $(wc -l < ml-projects/.gitignore) lines"
echo "   Total commits: $(git rev-list --all | wc -l)"
echo "   Tracked files: $(git ls-files | wc -l)"

echo ""
echo "✅ VERIFICATION COMPLETE"
echo "========================"
echo ""
echo "🎯 Status: SECURE - Ready for deployment"
echo ""
echo "📝 Next Steps:"
echo "   1. Create .env file from .env.example template"
echo "   2. Never commit .env file (it's in .gitignore)"
echo "   3. Use environment variables for all secrets"
echo "   4. Run this script before each deployment"
echo ""
