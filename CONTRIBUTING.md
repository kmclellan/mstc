# Contributing to MSTC
Thanks so much for helping with the development of the MSTC app! This guide
will cover the process for helping out with the project and should allow you
to get started quickly and easily. If you need any help with contributing,
please e-mail the project's Google Group: mstc-app@googlegroups.com or go to https://groups.google.com/d/forum/mstc-app.

## Getting Started
There are many of ways you can contribute to the MSTC project, from
[reporting bugs](#bug-reports) and [making suggestions](#feature-requests), to
[updating documentation](#improving-documentation) and [improving the codebase](#contributing-code).
If you're new to coding in general, the first three options are a good way to
familiarize yourself with the application and the overall codebase. If you're
new to Rails development, feel free to work on some of our less complex
issues, labeled with [`Difficulty 1 (OK)`](https://github.com/kmclellan/mstc/labels/Difficulty%201%20%28OK%29). If
you have any questions please feel free to comment in the GitHub issues or
contact the core team; we appreciate any and all help we can get!

## Reporting an Issue
If you've been using the MSTC app and [notice a bug](#bug-reports),
or want to [suggest a new feature](#feature-requests), please open a
[GitHub issue](https://github.com/kmclellan/mstc/issues/new).
Before doing so, however, please **search open / closed issues** to see if
someone else has already opened a similar issue.

### Bug Reports
A bug is a *verifiable problem* that is caused by the MSTC app code. Good
bug reports allow us to quickly identify the root causes of problems and
resolve them. Here are some guidelines for submitting bug reports:

1. **Is it a duplicate?** - check to see if the bug has already been reported.
2. **Has it been resolved?** - check if it can be reproduced using the `master`
   branch or a newer version.
3. **What is the problem?** - see if you can isolate exactly how to reproduce
   the issue.
4. **Include a screenshot or screencast** - you can use [LICEcap](http://www.cockos.com/licecap/)
   to capture a screencast and save it as an animated gif.
5. **Tell us all the things** - include as much information as possible (see
   the template below for a good starting point).

#### Bug Report Template (thanks [Ghost](https://github.com/TryGhost/Ghost) team!)
```
Short and descriptive example bug report title

### Issue Summary

A summary of the issue and the browser/OS environment in which it occurs. If
suitable, include the steps required to reproduce the bug.

### Steps to Reproduce

1. This is the first step
2. This is the second step
3. Further steps, etc.

Any other information you want to share that is relevant to the issue being
reported. Especially, why do you consider this to be a bug? What do you expect
to happen instead?

### Technical details:

* MSTC Version: [vX.X.X OR master (a1b2c3)]
* Operating System: [Operating System X]
* Browser: [Browser vX.X.X]
```

A member of the core team will label your issue appropriately and may follow
up for more information. We try to deal with bugs as quickly as possible and
will keep the issue updated with our progress, but it may take some time
before it is resolved.

### Feature Requests
Feature requests are always welcome as well. Before submitting a feature
request, please search both opened and closed issues to see if the feature has
already been requested. Remember that it's up to *you* to convince the core
team of the merits of the feature. Please include as much detail as possible,
including but not limited to the use case, a proposed implementation, and why
it is likely to be useful.

## Improving Documentation
One great way of helping out is improving documentation, which can take the
form of user-, developer- , and sysadmin-facing documentation. 

Our user-facing documentation is located on our GitHub Pages [site](https://kmclellan.github.io/mstc).

Our developer- and sysadmin-facing documentation is located in code
comments, in our [README](https://github.com/kmclellan/mstc/blob/master/README.md),
in the `/doc` folder of the repo, and in our [GitHub wiki](https://github.com/kmclellan/mstc/wiki).

The easiest way to make small improvements to our user-facing documentation is
by editing the file with the online GitHub editor: browse the
[`gh-pages` branch](https://github.com/kmclellan/mstc/tree/gh-pages),
choose the file you want to edit, click the "Edit" button, make changes, and
follow the GitHub instructions from there. Once your changes are merged they
will immediately appear on the website.

If you'd like to help comment our codebase to make it more easily
understandable, we ideally try to use [YARD](https://github.com/lsegal/yard)
for consistency and ease of use. That said, any documentation is helpful so
feel free to add comments where you feel necessary. If you'd like to suggest
changes to the wiki please [open up an issue](https://github.com/kmclellan/mstc/issues/new)
and let us know what you think should be changed.

## Contributing Code
Helping to improve the MSTC app codebase is **great**. In general, we only
accept pull requests for changes related to an open GitHub issue, so make sure
you open one (and it's approved) before you start working. This also makes it
easier to review and test your work. During active development there will be
[milestones](https://github.com/kmclellan/mstc/milestones) for upcoming
versions; we'd prefer if you select open issues from those over issues in the
[wish list](https://github.com/kmclellan/mstc/milestones/Wish%20List).
Otherwise, feel free to select any open issues, noting that we try to classify
them by rough priority using the labels beginning with `pri:`.

The following is an overview of how to work on the MSTC app:

### Fork the MSTC App / Create a Branch
Each developer working on the MSTC app should fork the core mstc
repository and clone it as a local repository. Remember to add the core
repository as a remote:

```
git remote add upstream git@github.com:kmclellan/mstc.git
```

You can either create a separate topic branch in your forked repository or
work off the forked `master` branch (we recommend the former). Make sure you
pull in the latest changes from `upstream` if you cloned a while ago
(`git pull upstream master`) before branching. We recommend prefixing the
branch name with the GitHub issue number and including a few descriptive
words, i.e. `1234_brief_issue_description`.

In the future we plan to maintain release branches for minor versions (e.g.
`release-v1.4`) for patching purposes so if you end up working on a version-
specific bug please make sure you branch off of the correct place.

### Testing
Make sure to update or add to the test suite where appropriate; patches and
features will not be accepted without tests. We use [RSpec](http://rspec.info/)
for general testing and [Capybara](http://jnicklas.github.io/capybara/) for
integration testing. Run `rake` to ensure that the current test suite passes before
submitting a pull request (PR).

### Code / Style Conventions
We use [Rubocop](http://batsov.com/rubocop/) as the arbiter of style for
the MSTC app. You should run `rubocop -D` to ensure that all of your changes
match the project conventions. We will occasionally allow exceptions from code
complexity violations; you should make any such request in the GitHub pull
request comments.

### Cleaning up your branch
Before you submit your PR (Pull Request), you should clean up your commit history and resolve
any merge conflicts with `master` (or your upstream branch). While we
recommend making a bunch of small commits while you're working, it's important
to maintain a readable and useful commit history in the main repository.

#### Squashing Commits

1. First, find out how many commits there are on your branch:
   ```
   git log --oneline master..your-branch-name | wc -l
   ```
2. Then, use an interactive rebase to squash all but the first commit unless
   you have a good reason to keep more than one:
   ```
   git rebase -i HEAD~#
   ```
   where `#` is the number of commits on your branch. Mark the first commit as
   `r` (for reword) so you can update the message and the rest as `s` (for
   squash).

In terms of the commit message, we recommend the following:
* The first line should summarize the impact of the commit and should be less
  than 72 characters. Note that this will likely go into the Changelog as well.
  * This should also be in the present tense / imperative mood (e.g. "Add
    feature" vs "Added feature" and "Change element" vs "Changes element").
* Leave the second line blank
* The third line should reference the issue this PR resolves, either
  `issue #1234` if you're just mentioning the issue or `closes #1234` if
  you're closing an issue.
  * If you don't have an issue to reference, make sure you don't need to open
    one before opening the PR.
* Use bullet points on the following lines to elaborate on your brief
  description.

Example:
```
Fix the very important thing that was broken

closes #1234
- change the first file
- change the second file
- take this other thing into account
- modify this other thing
```

#### Merge Conflicts
After you've squashed commits and crafted the perfect commit message, you need
to resolve any merge conflicts with the upstream branch. First, make sure that
you have latest version of `master` (or your upstream branch) checked out and
then rebase your squashed branch on top of it:
```
git checkout master
git pull upstream master
git checkout 1234_your_branch_name
git rebase master
```

Now just push your branch up to GitHub. If you've already pushed it prior to
rebasing, you'll need to force push it (using the `-f` flag, **CAREFULLY**),
otherwise you should be able to just push it normally:
```
git push origin 1234_your_branch_name
```

#### Testing
Before finally submitting, make sure that your branches passes all of our
tests and style checks:
```
rake
rubocop -D
```

### Submitting your PR
At this point you have a branch that is based off of the latest version of
your upstream branch with a clean history and useful commit message. To
submit, follow the following steps:

1. If you go to your fork's page on GitHub, there should be a prompt to submit
   a PR
   * If not go [here](https://github.com/kmclellan/mstc/compare), select
     `kmclellan/mstc` as the base fork and the relevant base branch and
     your fork as the head fork with your branch as the compare brach.
2. Click "Create Pull Request" and add a description which references the
   original issue (e.g. `Resolves #1234`), describes the changes you made and
   any new tools or libraries you added, as well as any breaking changes.

If it takes a while for your PR to be reviewed and new merge conflicts pop up,
simply follow the steps [above](#merge-conflicts) to resolve them and force
push your branch **CAREFULLY** back up to your fork (i.e. `origin`).

Finally, note that these are only one workflow you can use to generate
branches with useful commit history and resolve merge conflicts. As long as
you open up PR's that are clear and easy to merge, you can do whatever you
want.

## Code Review
The code review process generally includes the following steps:

1. Reading through the issue / PR comments to understand the original issue
   and the work that was done.
2. Checking out the branch and verifying that it resolves the issue / does
   what it claims to do.
3. Running the tests and style checks (either manually or via
   [Travis](https://travis-ci.org/kmclellan/mstc)).
4. Read through the diff to ensure that all changes make sense and that no
   potential bugs or inefficiencies are introduced.

You're welcome to participate in the code review of other people's PR's,
although the core team will have final say over whether or not to merge a PR.
Feel free to comment heavily and ask questions, provided you're polite and
respectful. If someone asks a question on your PR, please respond
constructively and informatively - there are no bad questions! For more
information see our [Code of Conduct](#code-of-conduct).

## Development Setup
The following are the major dependencies of MSTC:
* [Ruby 2.2.4](http://www.ruby-lang.org/)
* [Bundler](http://bundler.io/)
* a database server ([Postgresql](https://www.postgresql.org/) or any database supported
  by Rails)


Please read through the [README](https://github.com/kmclellan/mstc/blob/master/README.md)
for information about setting up your local installation of the MSTC app.

## Code of Conduct
*inspired by the [Angular.js](https://angularjs.org/) [code of conduct](https://github.com/angular/code-of-conduct/blob/master/CODE_OF_CONDUCT.md)*

As contributors and maintainers of the MSTC project, we pledge to
respect everyone who contributes by posting issues, updating documentation,
submitting pull requests, providing feedback in comments, and any other
activities.

Any communication must be constructive and never resort to personal attacks,
trolling, public or private harrassment, insults, or other unprofessional
conduct.

We promise to extend courtesy and respect to everyone involved in this project
regardless of gender, gender identity, sexual orientation, disability, age,
race, ethnicity, religion, or level of experience. We expect anyone
contributing to the MSTC project to do the same.

If any member of the community violates this code of conduct, the maintainers
of the MSTC project may take action, removing issues, comments, and
PRs or blocking accounts as deemed appropriate.

If you are subject to or witness unacceptable behavior, or have any other
concerns, please email us at `mstc-app@googlegroups.com`.
