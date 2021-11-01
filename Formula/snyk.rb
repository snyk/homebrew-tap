class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.749.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.749.0/snyk-macos"
    sha256 "20ce74dd12c07cc1344b676a58bc9b04d90e26b620a8b883958f572cd3d3954f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.749.0/snyk-linux"
    sha256 "27f782ff4c1d370fbcf003bc4ab8069bc68733465ff617104ebff61ecab3805a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
