#!/bin/bash -ex

TAG="1.7.2-R0.3"

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

# Push to https://github.com/Nukkit/CraftNukkit
git remote add patched git@github.com:Nukkit/CraftNukkit.git
git push patched master --force
