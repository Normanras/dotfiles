---
title: "Test"
date: 2023-09-12T17:19:08Z
draft: false
---

Yesterday, I could not get my ZSH shell to work at all. As I kept trying things, I was getting all these weird errors. I started posting about this on Mastodon too.

[Mastodon Thread](https://fosstodon.org/@notnorm/111047573608738701) where I kept asking myself - no responses!

Finally, I realized the issue. And that was the [Starship](https://www.starship.rs) cross-shell prompt. Turns out, it was making everything really really slow.

I finally got it fixed by doing the following:
* Delete everything from `~/.zsh_sessions/` and `~/.zsh_history`.
* Do not use `source ~/.zshrc` and definitely don't use it in your `zshrc` file! Instead of `source` use `exec zsh`
