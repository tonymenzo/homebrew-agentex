class Agentex < Formula
  include Language::Python::Virtualenv

  desc "Live LaTeX rendering interface for agent-assisted writing"
  homepage "https://github.com/tonymenzo/agenTeX"
  url "https://github.com/tonymenzo/agenTeX/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e07dbd2ea5909c56106045653641a067ae0c927460456239abb9838db8a0d289"
  license "MIT"

  depends_on "python@3.12"
  depends_on "tectonic"

  # -- Python resources -------------------------------------------------------
  # The url/sha256 placeholders below are filled in by:
  #     brew update-python-resources agentex
  # from a checkout of this tap. Run that once before the first publish.

  resource "orchestral-ai" do
    url "https://files.pythonhosted.org/packages/source/o/orchestral-ai/orchestral-ai-1.4.0.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/source/f/fastapi/fastapi-0.110.0.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/source/u/uvicorn/uvicorn-0.27.0.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  resource "watchdog" do
    url "https://files.pythonhosted.org/packages/source/w/watchdog/watchdog-4.0.0.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic/pydantic-2.7.0.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/source/p/python-dotenv/python-dotenv-1.0.1.tar.gz"
    sha256 "REPLACE_WITH_PYPI_SHA256"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # `set` with no args lists ~/.config/agentex/env (creating it if needed)
    # and exits 0. Doesn't hit network or start a server.
    assert_match "agentex/env", shell_output("#{bin}/agentex set")
  end
end
