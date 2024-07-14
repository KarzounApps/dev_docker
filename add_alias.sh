#!/bin/bash

git config --global alias.tag-and-push '!f() { git tag -f $1 && git push -f origin $1 && git merge latest && git push origin main; }; f'
