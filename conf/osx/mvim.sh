# Build macvim from source with desired configuration options.

# Update Macvim or clone from GitHub.
if [ -f macvim ]; then
  git pull
else
  git clone https://github.com/b4winckler/macvim.git
fi

cd macvim/src
CC=clang ./configure --with-features=huge \
                     --enable-cscope \
                     --enable-rubyinterp \
                     --enable-pythoninterp \
                     --enable-python3interp \
                     --with-compiledby=robert.gardner@nyu.edu

make
cp MacVim/build/Release/MacVim.app /Applications/
