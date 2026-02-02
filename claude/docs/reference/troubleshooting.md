# Common Issues & Troubleshooting

**Quick solutions for frequent problems**

## Build Failures

**Issue**: `npm run build` fails with errors

**Solutions**:
```bash
# 1. Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install

# 2. Check Node.js version matches project requirement
node --version  # Compare with .nvmrc or package.json engines
nvm use  # If using nvm

# 3. Clear build cache
rm -rf dist/ build/ .next/ .cache/
npm run clean  # If project has clean script

# 4. Check for TypeScript errors
npm run type-check
```

**For Python**:
```bash
# Clear Python cache
find . -type d -name "__pycache__" -exec rm -r {} +
find . -type f -name "*.pyc" -delete

# Rebuild venv
rm -rf venv/
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## Test Failures

**Issue**: Tests failing unexpectedly

**Solutions**:
```bash
# 1. Run specific failing test
npm test -- path/to/test-file.test.js

# 2. Clear test cache
npm test -- --clearCache  # Jest
pytest --cache-clear      # Pytest

# 3. Reset test database (if using)
npm run test:db:reset
# or
python manage.py test --keepdb  # Django

# 4. Check for environmental issues
env | grep NODE_ENV  # Should be 'test'
env | grep DATABASE_URL  # Should point to test DB

# 5. Run tests in watch mode to debug
npm test -- --watch
pytest --lf  # Last failed only
```

**Common test issues**:
- Async timeout → Increase timeout in test
- Database state → Reset between tests
- Mocked dependencies → Check mock setup
- Timezone issues → Set TZ=UTC in test env

---

## Linting Errors

**Issue**: ESLint/Ruff showing many errors

**Solutions**:
```bash
# 1. Auto-fix what's fixable
npm run lint:fix
# or
ruff check --fix .

# 2. Check .eslintrc / .ruff.toml config
cat .eslintrc.js  # Review rules

# 3. Ignore specific line (use sparingly!)
// eslint-disable-next-line rule-name
const x = something;

# Python
x = something  # noqa: E501

# 4. Update ESLint and plugins
npm update eslint eslint-config-* eslint-plugin-*
```

**When to disable rules**:
- ✅ Third-party code you can't modify
- ✅ Generated code
- ⚠️ Temporary during refactor (add TODO)
- ❌ Just to make errors go away (fix the code instead)

---

## Type Errors

**Issue**: TypeScript/mypy showing type errors

**Solutions**:
```bash
# 1. Regenerate types (if using codegen)
npm run codegen
npm run graphql:generate

# 2. Check tsconfig.json settings
cat tsconfig.json  # Review strict mode, paths

# 3. Install missing type definitions
npm install -D @types/node @types/react  # etc.

# 4. Clear TypeScript cache
rm -rf node_modules/.cache/

# 5. For Python, check mypy config
mypy --show-config
```

**Common type issues**:
- `any` too permissive → Add proper types
- Null/undefined → Use optional chaining `?.`
- Type imports → Use `import type { }` (TS)
- Module not found → Check `paths` in tsconfig

**Type assertion** (last resort):
```typescript
const x = something as SomeType;  // Use only when you're certain
```

---

## Dependency Issues

**Issue**: Package installation fails or conflicts

**Solutions**:
```bash
# 1. Clear npm cache
npm cache clean --force

# 2. Delete lock file and reinstall
rm package-lock.json
npm install

# 3. Check for peer dependency conflicts
npm ls  # Shows dependency tree and conflicts

# 4. Update specific package
npm update [package-name]

# 5. Force resolutions (package.json)
{
  "resolutions": {
    "problematic-package": "1.2.3"
  }
}
```

**For Python**:
```bash
# Check dependency conflicts
pip check

# Install with verbose output
pip install -v [package]

# Use specific package index
pip install --index-url https://pypi.org/simple [package]
```

---

## Git Issues

**Issue**: Merge conflicts or push rejected

**Solutions**:
```bash
# View conflicts
git status
git diff

# Resolve conflicts manually in editor, then:
git add .
git commit -m "Resolve merge conflicts"

# Abort merge if needed
git merge --abort

# Force pull (CAREFUL - overwrites local)
git fetch origin
git reset --hard origin/main

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Discard all local changes
git reset --hard HEAD
```

**Push rejected**:
```bash
# Pull with rebase (cleaner history)
git pull --rebase origin main

# Force push (ONLY if you're sure and working alone)
git push --force-with-lease  # Safer than --force
```

---

## Performance Issues

**Issue**: App running slowly

**Solutions**:
```bash
# 1. Profile the application
npm run build -- --profile  # React
python -m cProfile script.py  # Python

# 2. Check bundle size
npm run build
ls -lh dist/  # Check file sizes

# 3. Analyze dependencies
npm ls --depth=0  # List direct dependencies
npx depcheck  # Find unused dependencies

# 4. Optimize development server
# Increase Node memory
export NODE_OPTIONS="--max-old-space-size=4096"
npm run dev
```

**Common performance fixes**:
- Large dependencies → Find smaller alternatives
- Re-rendering → Use React.memo, useMemo
- N+1 queries → Batch database calls
- Large images → Optimize/compress

---

## Environment Issues

**Issue**: Different behavior locally vs production

**Solutions**:
```bash
# 1. Check environment variables
env | grep NODE_ENV
cat .env  # Review local env vars

# 2. Match production environment locally
NODE_ENV=production npm run build
NODE_ENV=production npm start

# 3. Check .env.example for required vars
diff .env .env.example

# 4. Verify environment-specific config
cat config/production.js
```

**Environment debugging**:
```javascript
console.log('NODE_ENV:', process.env.NODE_ENV);
console.log('All env vars:', process.env);
```

---

## Permission Errors

**Issue**: EACCES or permission denied

**Solutions**:
```bash
# 1. Check file/directory ownership
ls -la

# 2. Fix npm global directory permissions (don't use sudo!)
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# 3. For file permissions
chmod +x script.sh  # Make executable
chmod 644 file.txt  # Read/write for owner, read for others

# 4. For directory access
chmod 755 directory/  # rwx for owner, rx for others
```

**NEVER `sudo npm install`** - Fix permissions instead

---

## Port Already in Use

**Issue**: `EADDRINUSE: address already in use :::3000`

**Solutions**:
```bash
# 1. Find process using the port
lsof -i :3000  # Linux/Mac
netstat -ano | findstr :3000  # Windows

# 2. Kill the process
kill -9 [PID]  # Linux/Mac
taskkill /PID [PID] /F  # Windows

# 3. Or use different port
PORT=3001 npm run dev

# 4. Add to .env
PORT=3001
```

---

## Database Connection Issues

**Issue**: Can't connect to database

**Solutions**:
```bash
# 1. Check database is running
# PostgreSQL
pg_isready

# MySQL
mysqladmin ping

# MongoDB
mongosh --eval "db.runCommand({ ping: 1 })"

# 2. Verify connection string
echo $DATABASE_URL

# 3. Check database credentials
psql -U username -d database  # Test login

# 4. Reset database (CAREFUL in production!)
npm run db:reset
python manage.py migrate --run-syncdb
```

---

## Module Not Found

**Issue**: `Cannot find module 'X'`

**Solutions**:
```bash
# 1. Install the module
npm install [module-name]

# 2. Check import path
# Relative: import x from './utils'  (has ./)
# Module: import x from 'lodash'  (no ./)

# 3. Clear module cache
rm -rf node_modules/.cache/

# 4. Check tsconfig paths (TypeScript)
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  }
}

# 5. Restart development server
```

---

## When All Else Fails

**Nuclear options** (use as last resort):

```bash
# 1. Complete clean reinstall
rm -rf node_modules package-lock.json
npm install

# 2. Clear all caches
npm cache clean --force
rm -rf ~/.npm
rm -rf node_modules/.cache

# 3. Restart computer
# Sometimes helps with file locks, network issues

# 4. Ask for help
# Document what you've tried
# Share error messages
# Provide context (OS, Node version, etc.)
```

---

## Getting Help

**Before asking**:
1. Read error message completely
2. Google exact error message
3. Check project's GitHub issues
4. Review recent changes (git diff)
5. Try on clean branch

**When asking**:
- Exact error message
- Steps to reproduce
- What you've tried
- Environment (OS, versions)
- Relevant code snippet

**Where to ask**:
- Project's GitHub issues
- Stack Overflow (for specific errors)
- Project's Discord/Slack
- `/context-deep` then ask Claude
