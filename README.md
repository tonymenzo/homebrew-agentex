# homebrew-agentex

Homebrew tap for [agentex](https://github.com/tonymenzo/agenTeX).

> A next-to-minimal live editing surface for agent-assisted writing.
>
> I wanted a LaTeX/Markdown editor with fluid LLM integration. Existing modalities have what I call "discontinuities" or UI gaps that hinder my "flow state" during writing. For example, within a web or desktop application (Claude, ChatGPT, and friends) you upload, you ask, you download, you diff manually if you want any versioning. CLI and API agents have no live canvas and suffer from merge races. Iterating in an IDE currently provides the smoothest experience, in my opinion but again suffers from versioning and merge conflicts.
>
> agen$\TeX$ is an attempt addressing these shortcomings. A master editing timeline allows for clear versioning and facilitates quick rewinds. Custom tools interface agents with the served documents and open external state tools usage for literature search and citation (arXiV, Google Scholar, iNSPIRE, PDG databases, etc), agent-based web surfing, etc. A "comments" panel supports standard annotations and doubles as an agentic message board.

## Install

```bash
brew tap tonymenzo/agentex
brew install agentex
```

This pulls in `tectonic` and a self-contained Python virtualenv. The `agentex` command lands on your PATH.

## Release process

When the main repo ships a new tagged version:

```bash
# In agenTeX:
git tag -a vX.Y.Z -m "agentex X.Y.Z"
git push origin vX.Y.Z
SHA=$(curl -sL https://github.com/tonymenzo/agenTeX/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256 | awk '{print $1}')

# In this tap:
sed -i '' "s|refs/tags/v[0-9.]*\.tar\.gz|refs/tags/vX.Y.Z.tar.gz|" Formula/agentex.rb
sed -i '' "1,/sha256/ s|sha256 \"[a-f0-9]*\"|sha256 \"$SHA\"|" Formula/agentex.rb
brew update-python-resources agentex   # refreshes Python dep SHAs if any changed
git commit -am "agentex X.Y.Z"
git push
```
