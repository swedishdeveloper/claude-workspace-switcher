class Cw < Formula
  desc "Switch between Claude Code profiles with isolated configs"
  homepage "https://github.com/swedishdeveloper/claude-workspace-switcher"
  url "https://github.com/swedishdeveloper/claude-workspace-switcher/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER"
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
