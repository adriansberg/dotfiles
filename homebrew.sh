#!/usr/bin/env bash

if test ! $(which brew)
then
    echo "Installing Homebrew."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

exit 0
