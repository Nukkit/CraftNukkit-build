#!/bin/bash -ex

TAG="1.7.9-R0.2"

# Get good version of CraftBukkit
git clone https://github.com/Bukkit/CraftBukkit.git
cd CraftBukkit
git reset --hard $TAG

# Clean the .git as the history contains broken commits
# and create a single commit
rm -rf .git
git init
git add .
git commit -m "Initial commit - CraftBukkit $TAG"

# Patch CraftBukkit
git am ../patches/*.patch

# Push to https://github.com/Nukkit/Nukkit
git remote add patched git@github.com:Nukkit/Nukkit.git
git push patched master --force
