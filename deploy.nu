rm -rf .git
git init
git add .
git config --global user.email "bot@victorare.mu"
git config --global user.name "Bot"
git commit -m "feat: initial commit"
git remote add origin git@github.com:ahkohd/mydotfiles.git
git pull origin develop --rebase
cd ~/.config/nu
nu deploy.nu
