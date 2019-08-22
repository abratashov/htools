# HTools
Handy Tools - a suite of useful tools for IT-guys in their everyday work.

#### Installation
`gem install htools`

### gt-rbs
This is a smart variation of the `git rebase` command. It helps to make the fastest painless `rebase` from any branch.

The main idea is to create a `backup` from your current branch. Then to re-create a new branch from the main that usually is `master` and perform `cherry-pick` from the `backup` branch.

It works just for one `top` commit (that is the common case when you work in your own `feature/###-super-feature` branch). Of course, if it contains more commits, before running it you have to `squash` them with help of `git rebase -i HEAD~2` (if you need to squash 2 first commits, etc).

A common scenario of developer daily routines is:
```
git checkout working-branch
git checkout -b working-branch-bak
git branch -D working-branch
git rev-parse HEAD #=> 4e6d1c95e773c7a4ce7adf60d236b1736d0993ae
git checkout master
git pull origin master
git checkout -b working-branch
git cherry-pick 4e6d1c95e773c7a4ce7adf60d236b1736d0993ae
```
And magic command `gt-rbs` do it for you, just type:
```
ht gt-rbs master working-branch
```

On any step, if something went wrong you can press `q` and then recover all that you need from `working-branch-bak` branch.
