class Cw < Formula
  desc "Switch between Claude Code profiles with isolated configs"
  homepage "https://github.com/swedishdeveloper/claude-workspace-switcher"
  url "https://github.com/swedishdeveloper/claude-workspace-switcher/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4402cba0defb4cabe25b055b3279f56c75c108c26d24a34e9273a94a1f66151a"
  license "MIT"

  def install
    bin.install "bin/cw"
    bash_completion.install "completions/cw.bash" => "cw"
    zsh_completion.install "completions/_cw"
  end

  test do
    assert_match "cw #{version}", shell_output("#{bin}/cw --version")
  end
end
